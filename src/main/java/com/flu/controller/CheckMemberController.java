package com.flu.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.checkMember.CheckMemberDTO;
import com.flu.checkMember.CheckMemberService;
import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping("/checkMember/**")
public class CheckMemberController {

	@Inject
	private CheckMemberService checkMemberService;
	@Inject
	private AlarmService alarmService;
	@Inject
	private MemberService memberService;
	private AlarmDTO alarmDTO;
	
	
	//신원확인 insert FORM으로 가기 
	@RequestMapping(value="memberCheckInsert", method=RequestMethod.GET)
	public void insert(Model model){
		model.addAttribute("active2", "a");
	}
	
	//신원확인 등록하기
	@RequestMapping(value="memberCheckInsert", method=RequestMethod.POST) //인터셉터 관리자에서 제외시키기 위한 메소드명
	public String insert(CheckMemberDTO checkMemberDTO,HttpSession session, MultipartHttpServletRequest request,Model model) throws Exception{
		MultipartFile multi = request.getFile("file1");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		FileSaver fileSaver = new FileSaver();
		try {
			String fileName = fileSaver.fileSave(realPath, multi);
			checkMemberDTO.setFname(fileName);
			checkMemberDTO.setOname(multi.getOriginalFilename());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = checkMemberService.insertTran(checkMemberDTO,session);
			
		String message = "실패";
		if(result>0){	
			message = "신청 완료되었습니다";
			String path = "./memberCheckInsert";

			MemberDTO memberDTO = memberService.memberView2(checkMemberDTO.getEmail());
			session.setAttribute("member", memberDTO);
			
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
			alarmDTO.setContents("신원확인 신청 하셨습니다. 관리자의 승인을 기다려 주세요.");
			alarmService.alarmInsert(alarmDTO);
			
			model.addAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

			model.addAttribute("message",message).addAttribute("path",path);
		}
		
		return "common/result";
		
	}
	
	//클라이언트 리스트 뿌려오기
	@RequestMapping(value="checkMemberClientList")
	public String clientlist(ListInfo listInfo, Model model){
		model.addAttribute("list",checkMemberService.clientList(listInfo)).addAttribute("board", "Client");
		
		return "checkMember/checkMemberList";
	}
	
	//프리랜서 리스트 뿌려오기
	@RequestMapping(value="checkMemberFreelancerList")
	public String freelancerlist(ListInfo listInfo, Model model){
		model.addAttribute("list",checkMemberService.freelancerList(listInfo)).addAttribute("board", "Freelancer");
		
		return "checkMember/checkMemberList";
	}
	
	
	
	//한명의 신원확인 페이지로 가기
	@RequestMapping(value="checkMemberView")
	public String checkView(String email,Model model){
		 model.addAttribute("checkMember",checkMemberService.checkView(email));
		 model.addAttribute("active2", "a");
		 return "checkMember/checkMemberView";
	}
	
	//신원확인을 완료시켜주는 것 
	@RequestMapping(value="checkMemberUpdate")

	public String update(String email, RedirectAttributes ra) throws Exception{
		
		checkMemberService.update(email);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(email);
		alarmDTO.setContents("신원확인이 완료 되었습니다. 프로젝트 등록 및 지원이 가능합니다.");
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/checkMember/checkMemberClientList";
	}
	
	//관리자가 신원확인에서 삭제하기
	@RequestMapping(value="checkMemberDelete")
	public String delete(String email){
		
		checkMemberService.deleteTran(email);
		
		return "redirect:/checkMember/checkMemberList";
	}
	
	//본인이 직접 신원확인요청 취소하기
	@RequestMapping(value="memberCheckCancel")
	public String cancel(String email,HttpSession session){
		
		checkMemberService.deleteTran(email);
		MemberDTO memberDTO = memberService.memberView2(email);
		session.setAttribute("member", memberDTO);
		
		return "redirect:/checkMember/memberCheckInsert";
	}
	
	
}

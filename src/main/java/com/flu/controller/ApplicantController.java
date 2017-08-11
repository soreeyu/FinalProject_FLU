package com.flu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;
import com.flu.project.ProjectDTO;

@Controller
@RequestMapping("/applicant/**")
public class ApplicantController {
	
	@Inject
	private ApplicantService applicantService;
	@Inject
	private MemberService memberService;
	@Inject
	private AlarmService alarmService;
	
	private AlarmDTO alarmDTO;
	
	//해당 프로젝트를 완료한 Applicant 리스트와 그들의 memberInfo 들고오기
	@RequestMapping(value="applicantListCheck")
	public String viewCash(Integer projectNum,Model model){

		List<ApplicantDTO> applicantList = applicantService.list(projectNum);

		List<CheckMemberViewDTO> memberList = new ArrayList<CheckMemberViewDTO>();
		
		for(int i=0;i<applicantList.size();i++){
			memberList.add(memberService.memberView(applicantList.get(i).getEmail()));
		}
		
		model.addAttribute("memberList", memberList).addAttribute("applicantList", applicantList);
		
		return "applicant/checkApplicantInfo";
	}
	
	
	
	//지원자의 상태 업데이트 (돈을 지급했다고 payFinish로 변경)
	@RequestMapping(value="applicantPayFinish")
	public String checkApplicantUpdate(String email, RedirectAttributes ra) throws Exception{
		
		int result = applicantService.appUpdate(email);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(email);
			alarmDTO.setContents("금액 지급이 완료 되었습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		}
		
		
		return "redirect:/checkProject/checkProjectFinishList";
	}
	
	
	//지원하기누르면 지원추가하기
	@RequestMapping(value="insertApplicant", method=RequestMethod.GET)
	public String insertApplicant(Model model, ApplicantDTO applicantDTO, ProjectDTO projectDTO, HttpSession session, RedirectAttributes rd) throws Exception{
		
		System.out.println("applicant 추가하기 들어옴");
		System.out.println("projectNum==="+projectDTO.getProjectNum());
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println("email-="+memberDTO.getEmail());
		System.out.println("state="+applicantDTO.getState());
		System.out.println(applicantDTO.getEmail());
		

		int checkCount = applicantService.checkApplicant(applicantDTO);
		if(checkCount==1){
			System.out.println("중복지원안되");
		}else{
			System.out.println("지원가능");
			int result = applicantService.insertApplicant(applicantDTO);
			if(result==1){
				System.out.println("지원성공");
				checkCount=1;
				alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(applicantDTO.getEmail());
				alarmDTO.setContents("프로젝트를 지원하셨습니다.");
				alarmService.alarmInsert(alarmDTO);
			}else{
				System.out.println("지원실패");
				alarmDTO.setEmail(applicantDTO.getEmail());
				alarmDTO.setContents("프로젝트를 지원에 실패했습니다.");
				alarmService.alarmInsert(alarmDTO);
			}
		}
		
		System.out.println(checkCount);
		rd.addAttribute("check", checkCount);
		//checkCount가 1이면 이미 지원을 한 상태이므로 지원이 불가하다고 View에 뿌려주기
		
		
		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	@RequestMapping(value="deleteApplicant", method=RequestMethod.GET)
	public void deleteApplicant(ApplicantDTO applicantDTO, Model model, HttpSession session, MemberDTO memberDTO) throws Exception{
		System.out.println("applicant Delete 들어옴");
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(applicantDTO.getEmail());
		int result = applicantService.deleteApplicant(applicantDTO);
		System.out.println("result=="+result);
		if(result==1){
			System.out.println("지원 취소 성공");
			alarmDTO.setContents("프로젝트 지원을 취소했습니다.");
		}else{
			System.out.println("지원 취소 실패");
			alarmDTO.setContents("프로젝트 지원을 취소실패했습니다.");
		}
		alarmService.alarmInsert(alarmDTO);

	}
}

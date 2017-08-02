package com.flu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.checkMember.CheckMemberDTO;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;

@Controller
@RequestMapping("/applicant/**")
public class ApplicantController {
	
	@Inject
	private ApplicantService applicantService;
	@Inject
	private MemberService memberService;
	@Inject
	private AlarmService alarmService;
	
	//해당 프로젝트를 완료한 Applicant 리스트와 그들의 memberInfo 들고오기
	@RequestMapping(value="applicantListCheck")
	public String viewCash(Integer projectNum,Model model){

		List<ApplicantDTO> applicantList = applicantService.list(projectNum);

		List<CheckMemberViewDTO> memberList = new ArrayList<CheckMemberViewDTO>();
		
		for(int i=0;i<applicantList.size();i++){
			memberList.add(memberService.memberView(applicantList.get(i).getEmail()));
			System.out.println(memberList.get(i).getName());
		}
		
		
		
		model.addAttribute("memberList", memberList).addAttribute("applicantList", applicantList);
		
		return "applicant/checkApplicantInfo";
	}
	
	
	
	//지원자의 상태 업데이트 (돈을 지급했다고 payFinish로 변경)
	@RequestMapping(value="applicantPayFinish")
	public String checkApplicantUpdate(String email, RedirectAttributes ra) throws Exception{
		
		int result = applicantService.appUpdate(email);
		if(result>0){
			AlarmDTO alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(email);
			alarmDTO.setContents("금액 지급이 완료 되었습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		}
		
		
		return "redirect:/checkProject/checkProjectFinishList";
	}
	
}

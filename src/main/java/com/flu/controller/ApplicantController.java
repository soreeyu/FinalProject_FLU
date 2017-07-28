package com.flu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;

@Controller
@RequestMapping("/applicant/**")
public class ApplicantController {
	
	@Inject
	private ApplicantService applicantService;
	@Inject
	private MemberService memberService;
	
	//해당 프로젝트를 완료한 Applicant 리스트와 그들의 memberInfo 들고오기
	@RequestMapping(value="applicantListCheck")
	public String viewCash(Integer projectNum,Model model){

		List<ApplicantDTO> applicantList = applicantService.list(projectNum);

		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		for(int i=0;i<applicantList.size();i++){
			memberList.add(memberService.memberView(applicantList.get(i).getEmail()));
			System.out.println(memberList.get(i).getName());
		}
		
		
		
		model.addAttribute("memberList", memberList).addAttribute("applicantList", applicantList);
		
		return "applicant/checkApplicantInfo";
	}
	
	
	
	//지원자의 상태 업데이트 (돈을 지급했다고 payFinish로 변경)
	@RequestMapping(value="applicantPayFinish")
	public String checkApplicantUpdate(String email){
		
		applicantService.appUpdate(email);

		
		return "redirect:/checkProject/checkProjectFinishList";
	}
	
}

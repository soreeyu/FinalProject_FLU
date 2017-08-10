package com.flu.home;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.tproject.EchoHandler;



import com.flu.applicant.ApplicantService;
import com.flu.freelancer.FreelancerDTO;
import com.flu.freelancer.FreelancerService;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Inject
	private EchoHandler echoHandler; 
	@Inject
	private ProjectService projectService;
	@Inject
	private MemberService memberService;
	@Inject
	private ApplicantService applicantService;
	@Inject
	private FreelancerService freelancerService;
	
	private ProjectDTO projectDTO;
	private ListInfo listInfo;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) throws Exception{
		ListInfo listInfo = new ListInfo();
		listInfo.setCurPage(1);
		listInfo.setPerPage(10);
		
		//프로젝트
		int pjcount = projectService.projectListcount(projectDTO);
		int mcount = memberService.memberCountTotal();
		int budget = projectService.totalBudget();
		List<ProjectDTO> ar = projectService.indexProjectList();
		List<ProjectDTO> ar2 = new ArrayList<ProjectDTO>();

		//프리랜서
		List<FreelancerDTO> freelancer = freelancerService.indexFreelancerList();
		int count1=1;
		int count2=1;
		int pay=1;
		
		if(ar!=null && freelancer!=null){	
			
		for(int i=0;i<6;i++){	
			projectDTO = new ProjectDTO();
			projectDTO.setSkills(ar.get(i).getSkill().split(","));
			projectDTO.setProjectNum(ar.get(i).getProjectNum());
			ar.get(i).setAppCount(applicantService.countApplicant(ar.get(i).getProjectNum()));
			ar2.add(projectDTO);	
		}
		
		for(int j=0; j<6;j++){
			//진행중인 프로젝트 Count
			count1 = memberService.memberProjectCount_ING(freelancer.get(j).getEmail());
			//완료한 프로젝트 Count
			count2 = memberService.memberProjectCount_FIN(freelancer.get(j).getEmail());
			//누적 완료 금액
			pay = memberService.memberProjectSumPay(freelancer.get(j).getEmail());
			
		}
		
		
		}else {
			pjcount=0;
			mcount=0;
			budget=0;
			ar=null;
			ar2=null;
		}

		List<ProjectDTO> countList = projectService.roomCount();
		echoHandler.roomCount(countList);

		model.addAttribute("pjcount", pjcount);
		model.addAttribute("mcount", mcount);
		model.addAttribute("budget", budget);
		model.addAttribute("indexList", ar);
		model.addAttribute("skills", ar2);
		model.addAttribute("freelancer", freelancer);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		model.addAttribute("pay", pay);
		
		
		return "index";
		
	}
	@RequestMapping(value="/home")
	public String test(){
		
		return "home";
	}
	
}

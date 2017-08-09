package com.flu.home;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.applicant.ApplicantService;
import com.flu.freelancer.FreelancerService;
import com.flu.member.MemberService;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
		
		//프로젝트
		int pjcount = projectService.projectListcount(projectDTO);
		int mcount = memberService.memberCountTotal();
		int budget = projectService.totalBudget();
		List<ProjectDTO> ar = projectService.indexProjectList();
		List<ProjectDTO> ar2 = new ArrayList<ProjectDTO>();

		//프리랜서
		int fcount = freelancerService.totalcount(listInfo);
		
		
		for(int i=0;i<6;i++){	
			projectDTO = new ProjectDTO();
			projectDTO.setSkills(ar.get(i).getSkill().split(","));
			projectDTO.setProjectNum(ar.get(i).getProjectNum());
			ar.get(i).setAppCount(applicantService.countApplicant(ar.get(i).getProjectNum()));
			ar2.add(projectDTO);
			
		}
		
		
	
		model.addAttribute("pjcount", pjcount);
		model.addAttribute("mcount", mcount);
		model.addAttribute("budget", budget);
		model.addAttribute("indexList", ar);
		model.addAttribute("skills", ar2);
		
		
		
		return "index";

	}
	@RequestMapping(value="/home")
	public String test(){
		
		return "home";
	}
	
}

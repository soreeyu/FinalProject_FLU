package com.flu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.file.FileService;
import com.flu.freelancer.FreelancerDTO;
import com.flu.freelancer.FreelancerService;
import com.flu.member.MemberDTO;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.PortFolioImg;
import com.flu.profile.Skill;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/member/**")
public class FreelancerController {

	@Inject
	private FreelancerService freelancerService;
	
	@Inject
	private AlarmService alarmService;
	
	@Inject
	private ApplicantService applicantService;
	
	private AlarmDTO alarmDTO;

	//이메일 가져오는 메서드
	private String getEmail(HttpSession session){
		return ((MemberDTO)session.getAttribute("member")).getEmail();
	}

	//세션에서 이메일 가져와 프리랜서 뷰 하나 가져오는 메서드
		private MemberDTO freelancerview(HttpSession session){
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			System.out.println(memberDTO.getEmail());
			
			
			return freelancerService.freelancerView(memberDTO.getEmail());
		}
		//디티오를 하나 받아 관심분야를 스플릿해서 디티오와 관심분야를 맵으로 가져오는 메서드
		private Map<String, Object> freelancerview2(String email){
			Map<String, Object> map = freelancerService.freelancerView2(email);
			return map;
		}
	//계정 정보를 가져오는메서드
		private MemberDTO getMemberDTO(String email){
			return freelancerService.freelancerMemberView(email);
		}

	//프리랜서 리스트
	@RequestMapping(value="freelancerList", method=RequestMethod.GET)
	public String freelancerList(ListInfo listInfo, Model model){
		
		if(listInfo.getSearch() == null){
			listInfo.setSearch("");
		}
		
		
		int totalCount = freelancerService.totalcount(listInfo);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		System.out.println("총 갯수 : "+totalCount);
		model.addAttribute("listinfo", listInfo);
		model.addAttribute("count", totalCount);
		model.addAttribute("map",freelancerService.freelancerList(listInfo));
		model.addAttribute("eval", freelancerService.freelancerListEval(listInfo));
		
		//추가로 가져와야 할것 각 멤버별 평점
		
		
		
		
		return "/member/freelancer/freelancerlist";
	}
	//프리랜서 마이페이지
	@RequestMapping(value="freelancermypage")
	public String freelancermypage(HttpServletRequest request, Model model, HttpSession session){
		String email = (String)request.getAttribute("email");
		System.out.println("누구이메일 :"+email);
		System.out.println("세션이메일 :"+this.getEmail(session));
		System.out.println(email.equals(this.getEmail(session)));
		model.addAttribute("active1", "a");
		if(email.equals(this.getEmail(session))){
			System.out.println("여기?111111");
		model.addAttribute("memberDTO", freelancerService.freelancerMemberView(this.getEmail(session)));
		model.addAttribute("freelancer", freelancerService.freelancerView(this.getEmail(session)));
		model.addAttribute("portfolio", freelancerService.portfolioList(this.getEmail(session)));
		model.addAttribute("skills", freelancerService.skillList(this.getEmail(session)));
		model.addAttribute("academic", freelancerService.academicList(this.getEmail(session)));
		model.addAttribute("carrer", freelancerService.carrerList(this.getEmail(session)));
		model.addAttribute("license", freelancerService.licenseList(this.getEmail(session)));

		model.addAttribute("evaluation", freelancerService.evaluationList2(this.getEmail(session)));
		model.addAttribute("myproject", freelancerService.myprojectList(this.getEmail(session)));
		model.addAttribute("projectName", freelancerService.getProjectName(this.getEmail(session)));
		model.addAttribute("email", this.getEmail(session));
		}else{
			System.out.println("여기?2222222");
			System.out.println(freelancerService.freelancerMemberView(email).getNickName());
			model.addAttribute("memberDTO", freelancerService.freelancerMemberView(email));
			model.addAttribute("freelancer", freelancerService.freelancerView(email));
			model.addAttribute("portfolio", freelancerService.portfolioList(email));
			model.addAttribute("skills", freelancerService.skillList(email));
			model.addAttribute("academic", freelancerService.academicList(email));
			model.addAttribute("carrer", freelancerService.carrerList(email));
			model.addAttribute("license", freelancerService.licenseList(email));
			
			model.addAttribute("evaluation", freelancerService.evaluationList2(email));
			model.addAttribute("myproject", freelancerService.myprojectList(email));
			model.addAttribute("projectName", freelancerService.getProjectName(email));
			model.addAttribute("email", email);
		}
		
		return "/member/freelancer/mypage";
	}




	/////////////////////////////////////////////////////////////////////////////////////////////

	//프리랜서 정보 뷰
	@RequestMapping(value="myinfoView")
	public String freelancerinfoView(HttpServletRequest request,Model model, HttpSession session){
		String email = (String)request.getAttribute("email");
		
		model.addAttribute("active8", "a");
		model.addAttribute("free", this.freelancerview2((this.getEmail(session))));
		model.addAttribute("email", email);
		return "/member/freelancer/freelancerinfoView";
	}
	
	//프리랜서 정보 등록
	@RequestMapping(value="infoInsert", method=RequestMethod.GET)
	public String freelancerinfoInsert(Model model, HttpRequest request){
		
		model.addAttribute("active8", "a");
		model.addAttribute("path", "infoInsert");
		return "/member/freelancer/freelancerinfo";
	}
	//프리샌서 정보 등록
	@RequestMapping(value="infoInsert", method=RequestMethod.POST)
	public String freelancerinfoInsert(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes)throws Exception{
		
		System.out.println("등록");
		System.out.println(freelancerDTO.getEmail());
		System.out.println(freelancerDTO.getJobKind());
		System.out.println(freelancerDTO.getInteresting());
		System.out.println(freelancerDTO.getPossibility());
		if(freelancerDTO.getInteresting() == null){
			freelancerDTO.setInteresting("");
			
		}

		int result=freelancerService.infoUpdate(freelancerDTO);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(freelancerDTO.getEmail());
			alarmDTO.setContents("필요한 정보를 등록하였습니다.");
			alarmService.alarmInsert(alarmDTO);
			
		}
		redirectAttributes.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		freelancerService.infoUpdate(freelancerDTO);

		redirectAttributes.addFlashAttribute("active8", "a");
		
		
		return "redirect:/member/myinfoView";
	}
	
	//프리랜서 정보 수정
	@RequestMapping(value="infoUpdate", method=RequestMethod.GET)
	public String freelancerinfoUpdate(Model model, HttpSession session, HttpServletRequest request){
		System.out.println("리퀘스트 : "+ request.getAttribute("email"));
		model.addAttribute("active8", "a");
		model.addAttribute("path", "infoUpdate");
		model.addAttribute("free", this.freelancerview2((this.getEmail(session))));
		return "/member/freelancer/freelancerinfo";
	}
	
	//프리랜서 정보 수정
	@RequestMapping(value="infoUpdate", method=RequestMethod.POST)
	public String freelancerinfoUpdate(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes)throws Exception{
		
		System.out.println("수정");
		System.out.println(freelancerDTO.getEmail());
		System.out.println(freelancerDTO.getJobKind());
		if(freelancerDTO.getInteresting() == null){
			freelancerDTO.setInteresting("");
			
		}
		System.out.println(freelancerDTO.getInteresting());
		System.out.println(freelancerDTO.getPossibility());
		

		int result = freelancerService.infoUpdate(freelancerDTO);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(freelancerDTO.getEmail());
			alarmDTO.setContents("필요한 정보를 수정 하였습니다.");
			alarmService.alarmInsert(alarmDTO);
			
		}
		redirectAttributes.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		freelancerService.infoUpdate(freelancerDTO);
		

		redirectAttributes.addFlashAttribute("active8", "a");
		
		return "redirect:/member/myinfoView";
	}
	
	//프리랜서 정보 입력(추가로 입력 Update)
	@RequestMapping(value="freeInsert2", method=RequestMethod.POST)
	public int freelancerInsert2(FreelancerDTO freelancerDTO){
		
		return 0;
	}
	
	
	
	
	
	//계정 정보 뷰
	@RequestMapping(value="personaldataView")
	public String personaldataView(){
		
		return "/member/freelancer/personaldata";
	}
	
	
	
	

	
	
	/************************** Intro **********************************/
	//자기소개 등록 폼
	@RequestMapping(value="introInsert", method=RequestMethod.GET)
	public String introInsert(Model model){
		model.addAttribute("active2", "a");
		model.addAttribute("path", "introInsert");
		return "/member/freelancer/introform";
	}
	//자기소개 등록
	@RequestMapping(value="introInsert", method=RequestMethod.POST)
	public String introInsert(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes)throws Exception{
		int result = freelancerService.introInsert(freelancerDTO);
		redirectAttributes.addFlashAttribute("active2", "a");
		
		if(result > 0){
			freelancerDTO = freelancerService.freelancerView(freelancerDTO.getEmail());
			redirectAttributes.addFlashAttribute("free", freelancerDTO);

			alarmDTO.setContents("자기소개를 성공적으로 등록하였습니다.");
			alarmService.alarmInsert(alarmDTO);		
			redirectAttributes.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

			return "redirect:/member/introView";
		}else{
			return "redirect:/member/introView";
		}
		
		
		//freelancerService
		
	}
	//자기소개 뷰
	@RequestMapping(value="introView")
	public String introView(HttpServletRequest request,HttpSession session, Model model){
		String email = (String)request.getAttribute("email");
		//자바스크립트 활용하기위한 값
		model.addAttribute("active2", "a");
		
		if(email.equals(this.getEmail(session))){
		model.addAttribute("free", this.freelancerview(session));
		model.addAttribute("email", this.getEmail(session));
		model.addAttribute("memberDTO",this.getMemberDTO(this.getEmail(session)));
		}else{
			model.addAttribute("free", freelancerService.freelancerView(email));
			model.addAttribute("email", email);
			model.addAttribute("memberDTO",this.getMemberDTO(email));
		}
		return "/member/freelancer/intro";
	}
	//자기소개 수정 폼
	@RequestMapping(value="introUpdate", method=RequestMethod.GET)
	public String introUpdate(HttpSession session, Model model){
		
		model.addAttribute("active2", "a");
		model.addAttribute("path", "introUpdate");
		model.addAttribute("free", this.freelancerview(session));
		return "/member/freelancer/introform";
		
	}
	//자기소개 수정
	@RequestMapping(value="introUpdate", method=RequestMethod.POST)

	public String introUpdate(HttpSession session, FreelancerDTO freelancerDTO, RedirectAttributes ra) throws Exception{

		int result = freelancerService.introUpdate(freelancerDTO);
		if(result > 0){
			alarmDTO.setEmail(freelancerDTO.getEmail());
			alarmDTO.setContents("등록된 자기소개를 성공적으로 수정 하였습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

			return "redirect:/member/introView";
		}else{
			return "redirect:/member/introView";
		}
	}
	
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	@RequestMapping(value="portfolioInsert", method=RequestMethod.GET)
	public String portfolioInsert(Model model) throws Exception{
		
		model.addAttribute("path", "portfolioInsert");
		return "/member/freelancer/portfolioform";
	}
	//포트폴리오 등록
	@RequestMapping(value="portfolioInsert", method=RequestMethod.POST)
	public String portfolioInsert(RedirectAttributes redirectAttributes, PortFolio portFolio, String contents1, String contents2, HttpSession session)throws Exception{
		System.out.println("1 : " +contents1);
		System.out.println("2 : " +contents2);
		
		FileService fileService = new FileService();
		List<PortFolioImg> ar = new ArrayList<PortFolioImg>();
		int arrage = 1;
		
		//파일 갯수만큼 업로드 및 객체에 이름 담기
		for(int i =0; i< portFolio.getF1().length; i++){
		
		if(!portFolio.getF1()[i].getOriginalFilename().equals("")){
			if(i == 0){
			portFolio.setPfFname(fileService.fileSave2(portFolio.getF1()[i], session));
			portFolio.setPfOname(portFolio.getF1()[i].getOriginalFilename());
			}else if(i == 1){
				
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave2(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents1);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}else if(i == 2){
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave2(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents2);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}
			
			}else{
				portFolio.setPfFname("");
				portFolio.setPfOname("");
			}
		}
		

		int result = freelancerService.portfolioInsert(portFolio, ar);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(this.getEmail(session));
		if(result>0){
			alarmDTO.setContents("포트폴리오 등록에 성공하였습니다.");
		}else {
			alarmDTO.setContents("포트폴리오 등록에 실패하였습니다. 다시 시도해 주세요");
		}
		alarmService.alarmInsert(alarmDTO);
		redirectAttributes.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		
		
		return "redirect:/member/portfolioList";
		
	}

	//포트폴리오 뷰
	@RequestMapping(value="portfolioView", method=RequestMethod.GET)
	public String portfolioView(Integer pfNum,HttpSession session, Model model){
		
		model.addAttribute("active3", "a");
		model.addAttribute("map", freelancerService.portfolioView(pfNum));
		return "/member/freelancer/portfolioView";
	}
	
	//포트폴리오 리스트
	@RequestMapping(value="portfolioList", method=RequestMethod.GET)
	public String portfolioList(HttpServletRequest request,HttpSession session, Model model){
		String email = (String)request.getAttribute("email");
		model.addAttribute("active3", "a");
		if(email.equals(this.getEmail(session))){
		model.addAttribute("list", freelancerService.portfolioList(this.getEmail(session)));
		model.addAttribute("email", this.getEmail(session));
		model.addAttribute("memberDTO",this.getMemberDTO(this.getEmail(session)));
		}else{
			model.addAttribute("list", freelancerService.portfolioList(email));
			model.addAttribute("email", email);
			model.addAttribute("memberDTO",this.getMemberDTO(email));
		}
		return "/member/freelancer/portfolio";
	}
	//포트폴리오 수정 폼
	@RequestMapping(value="portfolioUpdate", method=RequestMethod.GET)
	public String portfolioUpdate(Integer pfNum,Model model){
		
		model.addAttribute("map", freelancerService.portfolioView(pfNum));
		model.addAttribute("path", "portfolioUpdate");
		
		return "/member/freelancer/portfolioform";
	}
	//포트폴리오 수정
	@RequestMapping(value="portfolioUpdate", method=RequestMethod.POST)
	public String portfolioUpdate(Model model, PortFolio portFolio, String contents1, String contents2, HttpSession session) throws Exception{
		System.out.println("11: "+contents1);
		System.out.println("22 : " +contents2);
		FileService fileService = new FileService();
		List<PortFolioImg> ar = new ArrayList<PortFolioImg>();
		
		int arrage = 1;
		
		//파일 갯수만큼 업로드 및 객체에 이름 담기
		for(int i =0; i< portFolio.getF1().length; i++){
		
		if(!portFolio.getF1()[i].getOriginalFilename().equals("")){
			if(i == 0){
			portFolio.setPfFname(fileService.fileSave2(portFolio.getF1()[i], session));
			portFolio.setPfOname(portFolio.getF1()[i].getOriginalFilename());
			}else if(i ==1){
				System.out.println("여기냐1");
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave2(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents1);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}else if(i ==2){
				System.out.println("저기냐1");
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave2(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents2);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}
			
			
		}else{
			if(i == 0){
				if(((PortFolio)freelancerService.portfolioView(portFolio.getPfNum()).get("dto")).getPfFname() != ""){
					portFolio.setPfFname("");
					portFolio.setPfOname("");
				}else{
				portFolio.setPfFname(((PortFolio)freelancerService.portfolioView(portFolio.getPfNum()).get("dto")).getPfFname());
				portFolio.setPfOname(((PortFolio)freelancerService.portfolioView(portFolio.getPfNum()).get("dto")).getPfOname());
				}
				}else if(i ==1){
					System.out.println("여기냐2");
					PortFolioImg portFolioImg = new PortFolioImg();
					System.out.println("이거길이 : "+((List<PortFolioImg>)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).size());
					if(((List<PortFolioImg>)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).size() != 0){
						portFolioImg.setFimage("");
						portFolioImg.setOimage("");
					}else{
							portFolioImg.setFimage(((PortFolioImg)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).getFimage());
							portFolioImg.setOimage(((PortFolioImg)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).getOimage());
							
					}
					portFolioImg.setContents(contents1);
					portFolioImg.setArrage(Integer.toString(arrage));
					ar.add(portFolioImg);
					arrage++;
				}else if(i ==2){
					System.out.println("저기냐2");
					PortFolioImg portFolioImg = new PortFolioImg();
					if(((List<PortFolioImg>)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).size() != 0){
						portFolioImg.setFimage("");
						portFolioImg.setOimage("");
					}else{
					portFolioImg.setFimage(((PortFolioImg)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).getFimage());
					portFolioImg.setOimage(((PortFolioImg)freelancerService.portfolioView(portFolio.getPfNum()).get("imglist")).getOimage());
					}
					portFolioImg.setContents(contents2);
					portFolioImg.setArrage(Integer.toString(arrage));
					ar.add(portFolioImg);
					arrage++;
				}
		}
		}

		int result = freelancerService.portfolioUpdate(portFolio, ar);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(this.getEmail(session));
		if(result>0){
			alarmDTO.setContents("포트폴리오를 성공적으로 수정하였습니다.");
		}else {
			alarmDTO.setContents("포트폴리오를 수정하는데 실패하였습니다.");
		}
		alarmService.alarmInsert(alarmDTO);
		model.addAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		
		
		return "redirect:/member/portfolioList";
		
		
	}
	//포트폴리오 삭제
	@RequestMapping(value="portfolioDelete", method=RequestMethod.POST)
	public void portfolioDelete(String email){

	}
	/************************** Skill *******************************/
	//보유기술 등록 폼
	@RequestMapping(value="skillInsert", method=RequestMethod.GET)
	public String skillInsert(Model model){
		
		model.addAttribute("path", "skillInsert");
		model.addAttribute("data", "1");
		return "/member/freelancer/skillform";
	}
	//보유기술 등록
	@RequestMapping(value="skillInsert", method=RequestMethod.POST)

	public String skillInsert(Skill skill, RedirectAttributes ra) throws Exception{

		System.out.println(skill.getEmail());
		System.out.println(skill.getKind());
		System.out.println(skill.getSlevel());
		System.out.println(skill.getExp());
		
		System.out.println(skill.getExp().length());
		
		List<Skill> ar = new ArrayList<Skill>();
		
		alarmDTO.setEmail(skill.getEmail());
		if(skill.getExp().length() > 1){
			String [] sk1 = skill.getExp().split(",");
			String [] sk2 = skill.getKind().split(",");
			String [] sk3 = skill.getSlevel().split(",");
			System.out.println("배열 길이 : "+sk1.length);
			for(int i = 0; i < sk1.length; i++){
				Skill skill2 = new Skill();
				skill2.setEmail(skill.getEmail());
				skill2.setExp(sk1[i]);
				skill2.setKind(sk2[i]);
				skill2.setSlevel(sk3[i]);
				ar.add(skill2);
			}
			
			int result = freelancerService.skillInsert(ar);
			if(result>0){
				alarmDTO.setContents("당신이 등록한 보유기술들은 훌륭합니다.");
			}else {
				alarmDTO.setContents("무언가 실패했군요 ㅜㅜ 다시 등록하세요 ");
			}
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));


		}else if(skill.getExp().equals("0")){
			
		}else{
			ar.add(skill);

			int result = freelancerService.skillInsert(ar);
			if(result>0){
				alarmDTO.setContents("당신이 등록한 보유기술들은 훌륭합니다.");
			}else {
				alarmDTO.setContents("무언가 실패했군요 ㅜㅜ 다시 등록하세요 ");
			}
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));


		}
		
		
		
		
		return "redirect:/member/skillView";
	}

	//보유기술 뷰
	@RequestMapping(value="skillView", method=RequestMethod.GET)
	public String skillView(String email, Model model){
		model.addAttribute("active4", "a");
		return "/member/freelancer/skill";
	}
	
	//보유기술 리스트
	@RequestMapping(value="skillList", method=RequestMethod.GET)
	public String skillList(HttpServletRequest request,Model model, HttpSession session){
		String email = (String)request.getAttribute("email");
		
			
		
		model.addAttribute("active4", "a");
		if(email.equals(this.getEmail(session))){
		model.addAttribute("list", freelancerService.skillList(this.getEmail(session)));
		model.addAttribute("email", this.getEmail(session));
		model.addAttribute("memberDTO",this.getMemberDTO(this.getEmail(session)));
		}else{
			model.addAttribute("list", freelancerService.skillList(email));
			model.addAttribute("email", email);
			model.addAttribute("memberDTO",this.getMemberDTO(email));
		}
		return "/member/freelancer/skill";
	}
	
	//기술 리스트 불러오는 컨트롤러
	@RequestMapping(value="myskillList", method=RequestMethod.GET)
	public String myskillList(Model model, HttpSession session){
		
		model.addAttribute("list", freelancerService.skillList(this.getEmail(session)));
		
		return "/member/freelancer/myskillList";
	}
	
	
	//보유기술 수정 폼
	@RequestMapping(value="skillUpdate", method=RequestMethod.GET)
	public String skillUpdate(Model model, HttpSession session){
		
		model.addAttribute("active4", "a");
		model.addAttribute("path", "skillUpdate");
		model.addAttribute("data", "0");
		
		Map<String, Object> map = freelancerService.myskillList(this.getEmail(session));
		
		model.addAttribute("slevel", map.get("slevel"));
		model.addAttribute("exp", map.get("exp"));
		return "/member/freelancer/skillform";
	}
	
	//보유기술 수정
	@RequestMapping(value="skillUpdate", method=RequestMethod.POST)
	public String skillUpdate(Skill skill){
		System.out.println(skill.getEmail());
		System.out.println(skill.getKind());
		System.out.println(skill.getSlevel());
		System.out.println(skill.getExp());
		
		System.out.println(skill.getExp().length());
		
		List<Skill> ar = new ArrayList<Skill>();
		
		if(skill.getExp().length() > 1){
			String [] sk1 = skill.getExp().split(",");
			String [] sk2 = skill.getKind().split(",");
			String [] sk3 = skill.getSlevel().split(",");
			System.out.println("배열 길이 : "+sk1.length);
			for(int i = 0; i < sk1.length; i++){
				Skill skill2 = new Skill();
				skill2.setEmail(skill.getEmail());
				skill2.setExp(sk1[i]);
				skill2.setKind(sk2[i]);
				skill2.setSlevel(sk3[i]);
				ar.add(skill2);
			}
			
			
			freelancerService.skillUpdate(ar);
		}else if(skill.getExp().equals("0")){
			freelancerService.skillDelete(skill.getEmail());
		}else{
			ar.add(skill);
			freelancerService.skillUpdate(ar);
		}
		
		
		return "redirect:/member/skillList";
	}
	//보유기술 삭제
	@RequestMapping(value="skillDelete", method=RequestMethod.GET)
	public void skillDelete(String email){

	}
	/************************** Carrer *******************************/
	//경력, 학력, 자격증
	@RequestMapping(value="carrer", method=RequestMethod.GET)
	public String carrer(HttpServletRequest request, Model model, HttpSession session){
		String email = (String)request.getAttribute("email");
		model.addAttribute("active5", "a");
		
		if(email.equals(this.getEmail(session))){
		model.addAttribute("carrer", freelancerService.carrerList(this.getEmail(session)));
		model.addAttribute("academic", freelancerService.academicList(this.getEmail(session)));
		model.addAttribute("license", freelancerService.licenseList(this.getEmail(session)));
		model.addAttribute("email", this.getEmail(session));
		model.addAttribute("memberDTO",this.getMemberDTO(this.getEmail(session)));
		}else{
			model.addAttribute("carrer", freelancerService.carrerList(email));
			model.addAttribute("academic", freelancerService.academicList(email));
			model.addAttribute("license", freelancerService.licenseList(email));
			model.addAttribute("email", email);
			model.addAttribute("memberDTO",this.getMemberDTO(email));
		}
		return "/member/freelancer/carrer";
		
	}
	//경력 등록 폼
	@RequestMapping(value="carrerInsert", method=RequestMethod.GET)
	public String carrerInsert(Model model){
		
		model.addAttribute("active5", "a");
		model.addAttribute("carrerPath", "carrerInsert");
		return "/member/freelancer/carrerform";
	}
	//경력 등록
	@RequestMapping(value="carrerInsert", method=RequestMethod.POST)

	public String carrerInsert(Carrer carrer, RedirectAttributes ra) throws Exception{

		System.out.println(carrer.getEmail());
		System.out.println(carrer.getCompanyName());
		System.out.println(carrer.getDept());
		System.out.println(carrer.getPosition());
		System.out.println(carrer.getHireDate());
		System.out.println(carrer.getRetireDate());
		
		int result = freelancerService.carrerInsert(carrer);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(carrer.getEmail());
		if(result>0){
			alarmDTO.setContents("당신의 경력이 등록되었습니다.");
		}else {
			alarmDTO.setContents("경력등록에 실패하였습니다. 다시 확인해 주세요");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		
		return "redirect:/member/carrer";
	}

	//경력 뷰
	@RequestMapping(value="carrerView", method=RequestMethod.GET)
	public void carrerView(String email , Model model){
		model.addAttribute("active5", "a");
		
	}
	
	//경력 수정 폼
	@RequestMapping(value="carrerUpdate", method=RequestMethod.GET)
	public String carrerUpdate(Model model, Carrer carrer ,HttpSession session){
		model.addAttribute("active5", "a");
		model.addAttribute("carrerPath", "carrerUpdate");
		
		model.addAttribute("carrer", freelancerService.carrerView(carrer));
		
		return "/member/freelancer/carrerform";
	}
	//경력 수정
	@RequestMapping(value="carrerUpdate", method=RequestMethod.POST)
	public String carrerUpdate(Carrer carrer, RedirectAttributes ra) throws Exception{
		int result = freelancerService.carrerUpdate(carrer);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(carrer.getEmail());
		if(result>0){
			alarmDTO.setContents("당신의 경력을 수정하였습니다.");
		}else {
			alarmDTO.setContents("당신의 경력을 수정하는데 실패하였습니다. 다시 확인해 주세요.");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/member/carrer";

	}
	//경력 삭제
	@RequestMapping(value="carrerDelete", method=RequestMethod.GET)
	public String carrerDelete(Carrer carrer, RedirectAttributes ra) throws Exception{
		int result = freelancerService.carrerDelete(carrer);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(carrer.getEmail());
		if(result>0){
			alarmDTO.setContents("당신의 경력을 삭제 했습니다. 다시 등록해주실꺼죠?");
		}else {
			alarmDTO.setContents("삭제에 실패했습니다. 가만히 놔두 세요");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/member/carrer";

	}
	/************************** Academic *******************************/
	//학력 등록 폼
	@RequestMapping(value="academicInsert", method=RequestMethod.GET)
	public String academicInsert(Model model){
		
		model.addAttribute("academicPath", "academicInsert");
		return "/member/freelancer/academicform";
	}
	//학력 등록
	@RequestMapping(value="academicInsert", method=RequestMethod.POST)
	public String academicInsert(Academic academic, RedirectAttributes ra) throws Exception{
		int result = freelancerService.academicInsert(academic);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(academic.getEmail());
		if(result>0){
			alarmDTO.setContents("학력을 등록해주셨군요!!!!");
		}else {
			alarmDTO.setContents("학력 등록에 실패했어요 ㅜㅜㅜ 다시 등록해주세요 ㅜㅜ");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/member/carrer";
	}

	//학력 뷰
	@RequestMapping(value="academicView", method=RequestMethod.GET)
	public void academicView(String email, Model model){
		
	}
	
	//학력 수정 폼
	@RequestMapping(value="academicUpdate", method=RequestMethod.GET)
	public String academicUpdate(Model model, Academic academic, HttpSession session){
		
		model.addAttribute("academicPath", "academicUpdate");
		model.addAttribute("academic", freelancerService.academicView(academic));
		return "/member/freelancer/academicform";
	}
	
	//학력 수정
	@RequestMapping(value="academicUpdate", method=RequestMethod.POST)

	public String academicUpdate(Academic academic, RedirectAttributes ra) throws Exception{
		
		int result = freelancerService.academicUpdate(academic);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(academic.getEmail());
		
		if(result>0){
			alarmDTO.setContents("당신의 학력을 수정했어요!!!");
		}else {
			alarmDTO.setContents("이런 ㅜㅜ 당신의 학력을 수정하는데 실패 했네요 ㅜㅜ");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/member/carrer";

	}
	//학력 삭제
	@RequestMapping(value="academicDelete", method=RequestMethod.GET)

	public String academicDelete(Academic academic, RedirectAttributes ra) throws Exception{
		int result = freelancerService.academicDelete(academic);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(academic.getEmail());
		if(result>0){
			alarmDTO.setContents("당신의 학력은 삭제 됬네요. 다시 등록해야 할껄요??");
		}else {
			alarmDTO.setContents("다행이네요 삭제가 안됬어요 학력이!!!");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		return "redirect:/member/carrer";
	}
	/************************** License *******************************/
	//자격증 증록 폼
	@RequestMapping(value="licenseInsert", method=RequestMethod.GET)
	public String licenseInsert(Model model){
		
		model.addAttribute("licensePath", "licenseInsert");
		return "/member/freelancer/licenseform";
	}
	//자격증 등록
	@RequestMapping(value="licenseInsert", method=RequestMethod.POST)
	public String licenseInsert(License license, RedirectAttributes ra) throws Exception{
		
		int result = freelancerService.licenseInsert(license);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(license.getEmail());
			alarmDTO.setContents("자격증을 등록하셨습니다.");
			alarmService.alarmInsert(alarmDTO);
		}
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		return "redirect:/member/carrer";
	}

	//자격증 뷰
	@RequestMapping(value="licenseView", method=RequestMethod.POST)
	public void licenseView(String email, Model model){
	}
	//자격증 수정 폼
	@RequestMapping(value="licenseUpdate", method=RequestMethod.GET)
	public String licenseUpdate(Model model, License license, HttpSession session){

		model.addAttribute("licensePath", "licenseUpdate");
		model.addAttribute("license", freelancerService.licenseView(license));
		return "/member/freelancer/licenseform";
	}
	//자격증 수정
	@RequestMapping(value="licenseUpdate", method=RequestMethod.POST)

	public String licenseUpdate(License license, RedirectAttributes ra) throws Exception{

		System.out.println(license.getlName());
		System.out.println(license.getAgency());
		System.out.println(license.getPublishDate());
		System.out.println(license.getSeiralNum());

		int result = freelancerService.licenseUpdate(license);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(license.getEmail());
		if(result>0){
			alarmDTO.setContents("당신의 자격증 정보가 수정 되었어요!!");
		}else {
			alarmDTO.setContents("당신의 자격증 정보가 뭔가 이상하네요 ㅜㅜ 수정이 안되었어요 ㅜ");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));

		

		return "redirect:/member/carrer";
	}
	//자격증 삭제
	@RequestMapping(value="licenseDelete", method=RequestMethod.GET)
	public String licenseDelete(License license){
		freelancerService.licenseDelete(license);
		return "redirect:/member/carrer";
	}
	/************************** Evaluation *******************************/
	//평가 정보 등록
	@RequestMapping(value="evaluationInsert", method=RequestMethod.POST)
	public void evaluationInsert(Evaluation evaluation){

	}

	//평가 정보 리스트 - 클라이언트의 평가 항목
	@RequestMapping(value="evaluationView", method=RequestMethod.GET)
	public String evaluationView(HttpServletRequest request, HttpSession session, Model model){
		String email = (String)request.getAttribute("email");
		model.addAttribute("active6", "a");
		if(email.equals(this.getEmail(session))){
		model.addAttribute("evaluation", freelancerService.evaluationList2(this.getEmail(session)));
		model.addAttribute("myproject", freelancerService.myprojectList(this.getEmail(session)));
		model.addAttribute("projectName", freelancerService.getProjectName(this.getEmail(session)));
		model.addAttribute("email", this.getEmail(session));
		model.addAttribute("memberDTO",this.getMemberDTO(this.getEmail(session)));
		}else{
			model.addAttribute("evaluation", freelancerService.evaluationList2(email));
			model.addAttribute("myproject", freelancerService.myprojectList(email));
			model.addAttribute("projectName", freelancerService.getProjectName(email));
			model.addAttribute("email", email);
			model.addAttribute("memberDTO",this.getMemberDTO(email));
		}
		return "/member/freelancer/evaluation";
	}
	//평가 정보 수정
	@RequestMapping(value="evaluationUpdate", method=RequestMethod.POST)
	public void evaluationUpdate(Evaluation evaluation){

	}
	//평가 정보 삭제
	@RequestMapping(value="evaluationDelete", method=RequestMethod.GET)
	public void evaluationDelete(String email){

	}
	/************************* myproject *******************************/
	
	
	//내가 FLU 에서 진행한 프로젝트
	@RequestMapping(value="myproject")
	public String myproject(Model model, HttpSession session, ListInfo listInfo){
	
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		System.out.println("member가 뭘까="+memberDTO.getEmail());
		
		/*int totalCount = freelancerService.countAll(memberDTO);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		List<ProjectDTO> ar = freelancerService.listAll(memberDTO, listInfo);
		
		for(int i=0;i<ar.size();i++){
			System.out.println("지원한 프로젝트의 email을뽑아보자="+ar.get(i).getEmail());
		}
		
		model.addAttribute("list", ar);
		model.addAttribute("listInfo", listInfo);*/
		
		return "/member/freelancer/myproject";

	}
	
	@RequestMapping(value="myprojectInner")
	public void myprojectInner(Model model, ListInfo listInfo, HttpSession session, ProjectDTO projectDTO, MemberDTO memberDTO, ApplicantDTO applicantDTO){
		System.out.println("myprojectInner 들어옴");
		System.out.println("state는 ="+applicantDTO.getState());
		memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println("접속한 projectInner - member-email은 = "+memberDTO.getEmail());
		
		int totalCount = freelancerService.countAll(memberDTO, listInfo, applicantDTO);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		List<ProjectDTO> ar = freelancerService.listAll(memberDTO, listInfo, applicantDTO);
		
		for(int i=0;i<ar.size();i++){
			System.out.println("지원한 프로젝트의 email을뽑아보자="+ar.get(i).getEmail());
		}
		
		 for(int i=0;i<ar.size();i++){
        	 
	         System.out.println("ar의 Num=="+ar.get(i).getProjectNum());
	         ar.get(i).setAppCount(applicantService.countApplicant(ar.get(i).getProjectNum()));
	         System.out.println("ar의 appCount=="+ar.get(i).getAppCount());
	         }
		
		model.addAttribute("list", ar);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("member", memberDTO);
		model.addAttribute("applicant", applicantDTO);
		
	}
	
	
	
}

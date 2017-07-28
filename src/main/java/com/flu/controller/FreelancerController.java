package com.flu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.file.FileSaver;
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
import com.flu.project.ProjectService;

import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/member/**")
public class FreelancerController {

	@Inject
	private FreelancerService freelancerService;


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
		
		
		
		return "/member/freelancer/freelancerlist";
	}
	//프리랜서 마이페이지
	@RequestMapping(value="freelancermypage")
	public String freelancermypage(Model model, HttpSession session){
		
		model.addAttribute("active1", "a");
		model.addAttribute("freelancer", freelancerService.freelancerView(this.getEmail(session)));
		model.addAttribute("portfolio", freelancerService.portfolioList(this.getEmail(session)));
		model.addAttribute("skills", freelancerService.skillList(this.getEmail(session)));
		model.addAttribute("academic", freelancerService.academicList(this.getEmail(session)));
		model.addAttribute("carrer", freelancerService.carrerList(this.getEmail(session)));
		model.addAttribute("license", freelancerService.licenseList(this.getEmail(session)));
		model.addAttribute("evaluation", freelancerService.evaluationView(this.getEmail(session)));
		
		return "/member/freelancer/mypage";
	}




	/////////////////////////////////////////////////////////////////////////////////////////////

	//프리랜서 정보 뷰
	@RequestMapping(value="myinfoView")
	public String freelancerinfoView(Model model, HttpSession session){
		
		
		model.addAttribute("active8", "a");
		model.addAttribute("free", this.freelancerview2((this.getEmail(session))));
		return "/member/freelancer/freelancerinfoView";
	}
	
	//프리랜서 정보 등록
	@RequestMapping(value="infoInsert", method=RequestMethod.GET)
	public String freelancerinfoInsert(Model model){
		
		model.addAttribute("active8", "a");
		model.addAttribute("path", "infoInsert");
		return "/member/freelancer/freelancerinfo";
	}
	//프리샌서 정보 등록
	@RequestMapping(value="infoInsert", method=RequestMethod.POST)
	public String freelancerinfoInsert(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes){
		
		System.out.println("등록");
		System.out.println(freelancerDTO.getEmail());
		System.out.println(freelancerDTO.getJobKind());
		System.out.println(freelancerDTO.getInteresting());
		System.out.println(freelancerDTO.getPossibility());
		if(freelancerDTO.getInteresting() == null){
			freelancerDTO.setInteresting("");
			
		}
		freelancerService.infoUpdate(freelancerDTO);
		
		redirectAttributes.addFlashAttribute("active8", "a");
		
		
		return "redirect:/member/myinfoView";
	}
	
	//프리랜서 정보 수정
	@RequestMapping(value="infoUpdate", method=RequestMethod.GET)
	public String freelancerinfoUpdate(Model model, HttpSession session){

		model.addAttribute("active8", "a");
		model.addAttribute("path", "infoUpdate");
		model.addAttribute("free", this.freelancerview2((this.getEmail(session))));
		return "/member/freelancer/freelancerinfo";
	}
	
	//프리랜서 정보 수정
	@RequestMapping(value="infoUpdate", method=RequestMethod.POST)
	public String freelancerinfoUpdate(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes){
		
		System.out.println("수정");
		System.out.println(freelancerDTO.getEmail());
		System.out.println(freelancerDTO.getJobKind());
		if(freelancerDTO.getInteresting() == null){
			freelancerDTO.setInteresting("");
			
		}
		System.out.println(freelancerDTO.getInteresting());
		System.out.println(freelancerDTO.getPossibility());
		
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
	public String introInsert(FreelancerDTO freelancerDTO, RedirectAttributes redirectAttributes){
		int result = freelancerService.introInsert(freelancerDTO);
		redirectAttributes.addFlashAttribute("active2", "a");
		
		if(result > 0){
			freelancerDTO = freelancerService.freelancerView(freelancerDTO.getEmail());
			redirectAttributes.addFlashAttribute("free", freelancerDTO);
			return "redirect:/member/introView";
		}else{
			return "redirect:/member/introView";
		}
		
		
		//freelancerService
		
	}
	//자기소개 뷰
	@RequestMapping(value="introView")
	public String introView(HttpSession session, Model model){
		
		//자바스크립트 활용하기위한 값
		model.addAttribute("active2", "a");
		model.addAttribute("free", this.freelancerview(session));
		
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
	public String introUpdate(HttpSession session, FreelancerDTO freelancerDTO){
		int result = freelancerService.introUpdate(freelancerDTO);
		if(result > 0){
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
			portFolio.setPfFname(fileService.fileSave(portFolio.getF1()[i], session));
			portFolio.setPfOname(portFolio.getF1()[i].getOriginalFilename());
			}else if(i == 1){
				
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents1);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}else if(i == 2){
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave(portFolio.getF1()[i], session));
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
		
		freelancerService.portfolioInsert(portFolio, ar);
		
		
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
	public String portfolioList(HttpSession session, Model model){
		model.addAttribute("active3", "a");
		model.addAttribute("list", freelancerService.portfolioList(this.getEmail(session)));
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
			portFolio.setPfFname(fileService.fileSave(portFolio.getF1()[i], session));
			portFolio.setPfOname(portFolio.getF1()[i].getOriginalFilename());
			}else if(i ==1){
				System.out.println("여기냐1");
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave(portFolio.getF1()[i], session));
				portFolioImg.setOimage(portFolio.getF1()[i].getOriginalFilename());
				portFolioImg.setContents(contents1);
				portFolioImg.setArrage(Integer.toString(arrage));
				ar.add(portFolioImg);
				arrage++;
			}else if(i ==2){
				System.out.println("저기냐1");
				PortFolioImg portFolioImg = new PortFolioImg();
				portFolioImg.setFimage(fileService.fileSave(portFolio.getF1()[i], session));
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
		freelancerService.portfolioUpdate(portFolio, ar);
		
		
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
	public String skillInsert(Skill skill){
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
			
			
			freelancerService.skillInsert(ar);
		}else if(skill.getExp().equals("0")){
			
		}else{
			ar.add(skill);
			freelancerService.skillInsert(ar);
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
	public String skillList(Model model, HttpSession session){
		
		
			
		
		model.addAttribute("active4", "a");
		model.addAttribute("list", freelancerService.skillList(this.getEmail(session)));
		
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
	public String carrer(String email, Model model, HttpSession session){
		model.addAttribute("active5", "a");
		
		model.addAttribute("carrer", freelancerService.carrerList(this.getEmail(session)));
		model.addAttribute("academic", freelancerService.academicList(this.getEmail(session)));
		model.addAttribute("license", freelancerService.licenseList(this.getEmail(session)));
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
	public String carrerInsert(Carrer carrer){
		System.out.println(carrer.getEmail());
		System.out.println(carrer.getCompanyName());
		System.out.println(carrer.getDept());
		System.out.println(carrer.getPosition());
		System.out.println(carrer.getHireDate());
		System.out.println(carrer.getRetireDate());
		
		freelancerService.carrerInsert(carrer);
		
		
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
	public String carrerUpdate(Carrer carrer){
		freelancerService.carrerUpdate(carrer);
		
		return "redirect:/member/carrer";

	}
	//경력 삭제
	@RequestMapping(value="carrerDelete", method=RequestMethod.GET)
	public String carrerDelete(Carrer carrer){
		freelancerService.carrerDelete(carrer);
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
	public String academicInsert(Academic academic){
		freelancerService.academicInsert(academic);
		
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
	public String academicUpdate(Academic academic){
		
		freelancerService.academicUpdate(academic);
		return "redirect:/member/carrer";

	}
	//학력 삭제
	@RequestMapping(value="academicDelete", method=RequestMethod.GET)
	public String academicDelete(Academic academic){
		freelancerService.academicDelete(academic);
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
	public String licenseInsert(License license){
		
		freelancerService.licenseInsert(license);
		
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
	public String licenseUpdate(License license){
		System.out.println(license.getlName());
		System.out.println(license.getAgency());
		System.out.println(license.getPublishDate());
		System.out.println(license.getSeiralNum());
		freelancerService.licenseUpdate(license);
		
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

	//평가 정보 뷰
	@RequestMapping(value="evaluationView", method=RequestMethod.GET)
	public String evaluationView(String email, Model model){
		model.addAttribute("active6", "a");
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
		
		
				
		model.addAttribute("active7", "a");
		return "/member/freelancer/myproject";
	}
	
}

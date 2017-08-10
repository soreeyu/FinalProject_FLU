package com.flu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.file.FileSaver;
import com.flu.freelancer.FreelancerDTO;
import com.flu.freelancer.FreelancerService;
import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.project.sell.PjSellDTO;
import com.flu.project.sell.PjSellService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/project/**")
public class ProjectController {
   
   @Inject
   private ProjectService projectService;
   
   @Inject
	private AlarmService alarmService;
   @Inject
   private ApplicantService applicantService;
   @Inject
   private FreelancerService freelancerService;
   @Inject
   private PjSellService pjSellService;
   
   private AlarmDTO alarmDTO;

   //@ResponseBody
   @RequestMapping(value="projectMap", method=RequestMethod.GET)
   public Map<String, Object> projectMap(ListInfo listInfo, ProjectDTO projectDTO,List<String> array){
      
      System.out.println("controller-projectMap");
      

      int totalCount = projectService.projectCount(listInfo, projectDTO, array);
      listInfo.makePage(totalCount);
      listInfo.makeRow();
      
      
      Map<String, Object> map = new HashMap<String, Object>();

        List<ProjectDTO> pjlist = projectService.projectList(listInfo, projectDTO, array);
        
        map.put("pjlist", pjlist);
        

       
        System.out.println("list="+pjlist);
        System.out.println("size="+pjlist.size());
        System.out.println("getName="+pjlist.get(0).getName());
        
        return map;
   }
   
   
   //list
   @RequestMapping(value="projectList", method=RequestMethod.GET)
   public String projectList(Model model, ListInfo listInfo, ProjectDTO projectDTO, HttpSession session){
      
      MemberDTO memberDTO = new MemberDTO();
      memberDTO= (MemberDTO)session.getAttribute("member");
      
      int pjcount = projectService.projectListcount(projectDTO);
     
     
      model.addAttribute("listInfo", listInfo);
      model.addAttribute("member", memberDTO);
      model.addAttribute("pjcount", pjcount);

      
      
      return "project/projectList";
   }
   
   
   //급구 project 리스트 AJAX
   @RequestMapping(value="quickListInner", method=RequestMethod.GET)
   	public void quickListInner(Model model, ListInfo listInfo, ProjectDTO projectDTO, HttpSession session){
   		System.out.println("quickListInner요");
   		
   		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
   		System.out.println("count들어가기전");
   		int quickCount = projectService.quickCount(projectDTO);
   		System.out.println("quickCount=="+quickCount);
   		System.out.println("count들어간후");
   		/*listInfo.makePage(quickCount);
   		listInfo.makeRow();*/
   		System.out.println("여기는");
        List<ProjectDTO> ar = projectService.quickList(projectDTO, listInfo);
        System.out.println("급구리스트 사이즈==="+ar.size());     
        
        model.addAttribute("quicklist", ar);
        model.addAttribute("member", memberDTO);
        model.addAttribute("quickCount", ar.size());
   		
   	}
   
   //project 리스트 AJAX
   @RequestMapping(value="projectListInner", method=RequestMethod.GET)
   public void projectListInner(Model model, ListInfo listInfo, HttpSession session, ProjectDTO projectDTO,@RequestParam(value="array", required=true) List<String> array ){
      System.out.println("projectListInner요");
   
       MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
      
       System.out.println("controller-search==="+listInfo.getSearch());
         
      int totalCount =  projectService.projectCount(listInfo, projectDTO, array);
      System.out.println("projectListInner의 project count="+totalCount);
            
      listInfo.makePage(totalCount);
      listInfo.makeRow();
            
      List<ProjectDTO> ar = projectService.projectList(listInfo, projectDTO, array);
            
      for(int i=0;i<ar.size();i++){
	         ar.get(i).setAppCount(applicantService.countApplicant(ar.get(i).getProjectNum()));
	  }
      
      System.out.println("projectListInner의 ar="+ar);
 
      
      System.out.println("=====================");

      System.out.println("search="+listInfo.getSearch());
      System.out.println("kind="+listInfo.getKind());
      System.out.println("arrange="+listInfo.getArrange());
      System.out.println("curPage="+listInfo.getCurPage());
      System.out.println("=====================");   
      
      
      model.addAttribute("list", ar);
      model.addAttribute("type", "list");
      model.addAttribute("pjcount", totalCount);
      model.addAttribute("member", memberDTO);
      model.addAttribute("listInfo", listInfo);

      }
   

   //view
   @RequestMapping(value="projectView", method=RequestMethod.GET)
   public void projectView(Integer projectNum, Model model,ProjectDTO projectDTO, HttpSession session, MemberDTO memberDTO, ListInfo listInfo, @RequestParam(value="check", defaultValue="")Integer check){
      System.out.println("projectView");
      System.out.println("controller-projectNum="+projectDTO.getProjectNum());
      projectDTO = projectService.projectView(projectDTO);
      System.out.println("controller-projectNum="+projectDTO.getProjectNum());
      memberDTO = (MemberDTO)session.getAttribute("member");
      ApplicantDTO applicantDTO = new ApplicantDTO();
      applicantDTO.setEmail(memberDTO.getEmail());
      applicantDTO.setProjectNum(projectNum);
      int checkCount = applicantService.checkApplicant(applicantDTO);
      
      if(check==null){
    	  check=0;
      }
      int applyCount = applicantService.countApplicant(projectNum);
      
      //project를 등록한 사람의 정보를 가져오기
      MemberDTO mem = projectService.projectClient(projectDTO);
   
      System.out.println("phone="+memberDTO.getPhone());
      System.out.println("형태="+memberDTO.getKind());

      
      int sellResult = projectService.sellingCount(projectDTO);
      System.out.println("판매중인 프로젝트 갯수="+sellResult);
      int ingResult = projectService.ingCount(projectDTO);
      System.out.println("진행중 프로젝트갯수="+ingResult);
      int finishResult = projectService.finishCount(projectDTO);
      System.out.println("완료된 프로젝트=="+finishResult);
      int totalResult = projectService.pjCount(projectDTO);
      System.out.println("해당클라이언트 프로젝트토탈="+totalResult);
      
       System.out.println("포폴--"+freelancerService.portfolioList(memberDTO.getEmail()));
      
      PjSellDTO pjSellDTO = pjSellService.pjsellInfo(projectDTO);

       
      model.addAttribute("dto", projectDTO);
      model.addAttribute("member", memberDTO);
      model.addAttribute("conCount", sellResult);
      model.addAttribute("ingCount", ingResult);
      model.addAttribute("finishCount", finishResult);
      model.addAttribute("totalCount", totalResult);
      model.addAttribute("check", check);
      model.addAttribute("checkCount", checkCount);
      model.addAttribute("mem", mem);
      model.addAttribute("applyCount", applyCount);
      model.addAttribute("pjsell", pjSellDTO);

      //지원할 자격이 되는지 체크
      model.addAttribute("portfolio", freelancerService.portfolioList(memberDTO.getEmail()));
      model.addAttribute("skills", freelancerService.skillList(memberDTO.getEmail()));
      model.addAttribute("freelancer", freelancerService.freelancerView(memberDTO.getEmail()));
         
   }
   
   
   
   //projectInsert Form
   @RequestMapping(value="projectInsert", method=RequestMethod.GET)
   public String projectInsert(Model model, HttpSession session, MemberDTO memberDTO){
      System.out.println("projectInsertForm");
      model.addAttribute("type", "insert");
      
      memberDTO = (MemberDTO) session.getAttribute("member");
      System.out.println("email=="+memberDTO.getEmail());
      
      System.out.println(memberDTO.getKind());      
      return "project/projectInsert"; 
      
   }
   
   
   //project Insert
   @RequestMapping(value="projectInsert", method=RequestMethod.POST)
   public String projectInsert(ProjectDTO projectDTO, RedirectAttributes rd, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)throws Exception{
      
      System.out.println("projectInsert");
      

      
      //MultipartFile multi = multipartHttpServletRequest.getFile("fName");
      
      String realPath = session.getServletContext().getRealPath("resources/upload");
      
      FileSaver fileSaver = new FileSaver();
      String fname = fileSaver.fileSave(realPath, projectDTO.getFileName());
      
      projectDTO.setfName(fname);
      projectDTO.setoName(projectDTO.getFileName().getOriginalFilename());
   

      int result = projectService.projectInsert(projectDTO);
      
      String message = "fail";
      
      if(result==1){
         message = "success";
         alarmDTO = new AlarmDTO();
			System.out.println("프로젝트 등록"+((MemberDTO)session.getAttribute("member")).getEmail());
			alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
			alarmDTO.setContents("프로젝트를 성공적으로 등록하였습니다. 관리자의 검수를 기다리세요.");
			alarmService.alarmInsert(alarmDTO);
			rd.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
         
         
      }
      
      rd.addFlashAttribute("message", message);
      
      return "redirect:/project/projectList";
   }
   
   
   //update form (insert form 공유)
   @RequestMapping(value="projectUpdate", method=RequestMethod.GET)
   public String projectUpdate(Model model, ProjectDTO projectDTO, MemberDTO memberDTO, HttpSession session){
      System.out.println("projectUpdateForm");

      memberDTO = (MemberDTO) session.getAttribute("member");
      System.out.println("member의 email=="+memberDTO.getEmail());
      System.out.println("project의 email=="+projectDTO.getEmail());

      System.out.println(memberDTO.getKind());   
      
      projectDTO = projectService.projectView(projectDTO);
      System.out.println("projectNum="+projectDTO.getProjectNum());
      System.out.println("controller-project-name="+projectDTO.getName());
   
      model.addAttribute("type", "update");
      model.addAttribute("member", memberDTO);
      model.addAttribute("dto", projectDTO);
      
      return "project/projectInsert";
   }
   
   
   //update 하기
   @RequestMapping(value="projectUpdate", method=RequestMethod.POST)
   public String projectUpdate(ProjectDTO projectDTO, RedirectAttributes rd, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)throws Exception{
      System.out.println("projectUpdate");
      
      String realPath = session.getServletContext().getRealPath("resources/upload");
      
      FileSaver fileSaver = new FileSaver();
      String fname = fileSaver.fileSave(realPath, projectDTO.getFileName());
      
      projectDTO.setfName(fname);
      projectDTO.setoName(projectDTO.getFileName().getOriginalFilename());
   
      
      int result = projectService.projectUpdate(projectDTO);
      System.out.println(result);
      String message = "fail";
      if(result==1){
         message = "success";
         System.out.println("update success");
         alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(projectDTO.getEmail());
			alarmDTO.setContents("프로젝트의 정보를 성공적으로 수정하였습니다.");
			alarmService.alarmInsert(alarmDTO);
			rd.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
      }
      rd.addAttribute("message", message);
      
      return "redirect:/project/projectList";
   }
   
   
   //delete
   @RequestMapping(value="projectDelete")
   public String projectDelete(ProjectDTO projectDTO, RedirectAttributes rd){
      System.out.println("projectDelete");
      System.out.println("state=="+projectDTO.getState());
      
      String path="";
      
      if(projectDTO.getState().equals("fail")){ //만약 넘어온 상태가 fail이라면 관리자 모집실패 페이지로 주소 변경
         path = "redirect:/checkProject/checkProjectFailList";
      }else{  
      
	      int result =projectService.projectDelete(projectDTO.getProjectNum());
	      //관리자가 지웠을때 관리자 리스트로도 가게하려고 state가 필요해서 DTO로 크게 받는게 어떨까요?
	      
	      String message="";
	      if(result==1){
	         message="Delete success";
	      
	      rd.addAttribute("message", message);
	      
	      path = "redirect:/member/client/clientproject";
	      }else{
	    	  message="Delete fail";
	    	  path = "redirect:/member/client/clientproject";
	      }

      }
      return path;
   }


   //판매가능 리스트들 뿌려주기
   @RequestMapping(value="sellList")
   public String sellList(ProjectDTO projectDTO, ListInfo listInfo, Model model){
      System.out.println("sell List service들어옴");
      
      int count = projectService.sellCount(projectDTO);
      listInfo.makePage(count);
      listInfo.makeRow();
      List<ProjectDTO> sellar =  projectService.sellList(projectDTO, listInfo);
      
      
      model.addAttribute("list", sellar);
      model.addAttribute("listInfo", listInfo);
      model.addAttribute("pjcount", count);
      
      return "project/projectListInner";
   }

   
   //클라이언트의 프로젝트 완료 리스트에서 판매 Insert
   @RequestMapping(value="pjsellInsert", method=RequestMethod.POST)
   	public String pjsellInsert(PjSellDTO pjSellDTO, RedirectAttributes rd, ProjectDTO projectDTO){
   		System.out.println("pjsellInsert-controller");
   		

   		System.out.println("==============================");
   		System.out.println("state====="+projectDTO.getState());
   		String conState = projectDTO.getState();
   		int result = pjSellService.pjsellInsert(pjSellDTO);
   		int updateResult = 0;
   		if(result==1){
   			System.out.println("프로젝트 판매등록 성공");
   			
   			updateResult = projectService.updateProjectState(pjSellDTO);
   			if(updateResult==1){
   				System.out.println("프로젝트 상태 수정 성공");
   			}else{
   				System.out.println("프로젝트 상태 수정 실패");
   			}
   			
   		}else{
   			System.out.println("프로젝트 판매등록 실패");
   		}
   		
   	 int sellCheckCount = pjSellService.checkSellProject(pjSellDTO);
     System.out.println("sellCheckCount=="+sellCheckCount);
   		rd.addAttribute("sellCheck", result);
   		rd.addAttribute("updateResult", updateResult);
   		rd.addAttribute("conState", conState);
   		//sellCheck가 1이면 프로젝트 판매등록 성공 -> project-state sell로 update하기
   		
   		return "redirect:/member/client/clientproject?state=finish";
   	}
   
   @RequestMapping(value="cancleProjectState")
   public String cancleProjectState(PjSellDTO pjSellDTO, RedirectAttributes rd){
	   System.out.println("cancleProjectState-controller");
	   
	   int num = pjSellDTO.getProjectNum();
	   System.out.println("num==="+num);
	   
	   //pjsell DB에서 삭제햇는지를 알아보는 cancleResult
	   int cancleResult = pjSellService.deleteSellProject(num);
	   //project state를 sell->finish로 바꿧는지 알아보는 result
	   int result = projectService.cancleProjectState(pjSellDTO);
	   
	   if(cancleResult==1){
		   System.out.println("pjsell DB에서 삭제 성공");
		   if(result==1){
			   System.out.println("프로젝트 상태 finish로 바꾸기 성공");
		   }else{
			   System.out.println("상태 finish 바꾸기 실패");
		   }
	   }else{
		   System.out.println("pjsell DB에서 삭제 실패");
	   }
	   return "member/client/clientproject";
   }
   
   //지원자 선택 컨트롤러
   @RequestMapping(value="applicantCheck", method=RequestMethod.POST)
   public String applicantCheck(String paycheck, Integer projectNum){
	   System.out.println("지원자 선택 컨트롤러 들어옴");
	   
	   System.out.println("프로젝트 번호 :"+projectNum);
	   System.out.println("선택한 지원자 :"+paycheck);
	   
	   projectService.applicantCheck(paycheck, projectNum);
	   
	   return "redirect:/member/client/clientproject?state=recruit";
   }
   
   //계약완료 컨트롤러
   @RequestMapping(value="applicantMeet", method=RequestMethod.POST)
   public String applicantMeet(String pay, ProjectDTO projectDTO){
	   System.out.println("계약완료 컨트롤러 들어옴");
	   
	   System.out.println("스타트데이트 :"+projectDTO.getStartDate());
	   System.out.println("피니쉬데이트 :"+projectDTO.getFinishDate());
	   System.out.println("프로젝트 번호 :"+projectDTO.getProjectNum());
	   System.out.println("금액리스트"+pay);
	   
	   projectService.applicantMeet(pay, projectDTO);
	   
	   return "redirect:/member/client/clientproject?state=ing";
   }
   
}
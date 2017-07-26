package com.flu.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/project/**")
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	/*
	 // 프로젝트에 생성된 스케줄이 있는지 확인 //1번
      @ResponseBody
      @RequestMapping(value="check", method=RequestMethod.GET)
      public Map<String, Object> checkSchedule(Integer projectNum){
         System.out.println("check하러옴");
         System.out.println("projectNum = "+projectNum);
         Map<String, Object> map = new HashMap<String, Object>();
         ScheduleMainDTO result = null;
         try {
            result = scheduleService.checkSchedule(projectNum);

            System.out.println("check의 result = "+result);
            if(result != null){ //스케줄이 있음
               map.put("schedule", "y");
               
               String[] test = {"ajax","json","spring"};
               List<String> bobaelistString = new ArrayList<String>();
               bobaelistString.add("하이1");
               bobaelistString.add("하이2");
               map.put("bobaelistString", bobaelistString);
               List<SchedulePartDTO> bobaelist = scheduleService.partList(66);
               map.put("bobaelist", bobaelist);
               map.put("testbobae", test);
               
               map.put("scheduleMainDTO", result);//있을경우는 scheduleNum을 보내줌  
               //model.addAttribute("schedule", "y");
               //model.addAttribute("scheduleMainDTO", result); 
               System.out.println("스케줄있음");

            }else{//스케줄이 없음 
               map.put("schedule", "n");
               map.put("projectNum", projectNum);
               //model.addAttribute("schedule", "n");
               //model.addAttribute("projectNum", projectNum); //없으면 없으니까 만들건지 물어보기
               System.out.println("스케줄없음");
            }
            //map.put("", "schedule/scheduleMain")
         } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("check할때 오류임 ");
            map.put("schedule", "error");
            e.printStackTrace();
         }
         return map;

      }
	 * 
	 * */
	//@ResponseBody
	@RequestMapping(value="projectMap", method=RequestMethod.GET)
	public Map<String, Object> projectMap(ListInfo listInfo){
		
		System.out.println("들어옴");
		

		int totalCount = projectService.projectCount(listInfo);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		
		
		Map<String, Object> map = new HashMap<String, Object>();

        List<ProjectDTO> pjlist = projectService.projectList(listInfo);
        
        map.put("pjlist", pjlist);
        
 

       
        System.out.println("list="+pjlist);
        System.out.println("size="+pjlist.size());
        System.out.println("getName="+pjlist.get(0).getName());
        
        return map;
	}
	
	
	//list
	@RequestMapping(value="projectList", method=RequestMethod.GET)
	public String projectList(Model model, ListInfo listInfo, ProjectDTO projectDTO, HttpSession session){


		int totalCount = projectService.projectCount(listInfo);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		List<ProjectDTO> ar = projectService.projectList(listInfo);
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO= (MemberDTO)session.getAttribute("member");
		/*System.out.println("projectController-memberEmail="+memberDTO.getEmail());*/
	
		model.addAttribute("list", ar);
		model.addAttribute("type", "list");
		model.addAttribute("pjcount", totalCount);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("member", memberDTO);
		
		
		return "project/projectList";
	}
	
	
	@RequestMapping(value="arrangeMoney", method=RequestMethod.GET)
	public void arrangeMoney(Model model, ListInfo listInfo){
		System.out.println("=====================");
		System.out.println("arrangeMoney");
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		System.out.println(listInfo.getArrange());
		System.out.println(listInfo.getCurPage());
		System.out.println("=====================");	
	}
	
	//view
	@RequestMapping(value="projectView", method=RequestMethod.GET)
	public void projectView(Integer projectNum, Model model, HttpSession session, MemberDTO memberDTO){
		if(projectNum==null){
			projectNum=1;
		}
		
		ProjectDTO projectDTO = projectService.projectView(projectNum);

		System.out.println("session의 사진을 불러와보자");
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		
		model.addAttribute("dto", projectDTO);
		model.addAttribute("member", memberDTO);
		
	}
	
	
	
	//projectInsert Form
	@RequestMapping(value="projectInsert", method=RequestMethod.GET)
	public String projectInsert(Model model, HttpSession session, MemberDTO memberDTO){
		System.out.println("projectInsertForm");
		model.addAttribute("type", "insert");
		
		memberDTO = (MemberDTO) session.getAttribute("member");
		System.out.println("email=="+memberDTO.getEmail());
		
		System.out.println(memberDTO.getKind());	
		/*if(memberDTO.getKind().equals("client")){
			System.out.println("client다");
		}else if(memberDTO.equals(null)){
			System.out.println("null");
			return "index";
		}else{
			
		}*/
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
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//update form (insert form 공유)
	@RequestMapping(value="projectUpdate", method=RequestMethod.GET)
	public String projectUpdate(Model model, ProjectDTO projectDTO, MemberDTO memberDTO, HttpSession session){
		System.out.println("projectUpdateForm");

		memberDTO = (MemberDTO) session.getAttribute("member");
		System.out.println("email=="+memberDTO.getEmail());
		System.out.println(projectDTO.getEmail());
		if(memberDTO.getEmail()==projectDTO.getEmail()){
		
			System.out.println(memberDTO.getKind());	
			System.out.println("수정가능");
		}else{
			

			System.out.println(memberDTO.getKind());	
			System.out.println("수정 불가능");
		}
		
	
		
		model.addAttribute("type", "update");
		model.addAttribute("dto", projectDTO);
		
		return "project/projectInsert";
	}
	
	//update
	@RequestMapping(value="projectUpdate", method=RequestMethod.POST)
	public String projectUpdate(ProjectDTO projectDTO, RedirectAttributes rd){
		System.out.println("projectUpdate");
		
		int result = projectService.projectUpdate(projectDTO);
		System.out.println(result);
		String message = "fail";
		if(result==1){
			message = "success";
			System.out.println("update success");
		}
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//delete
	@RequestMapping(value="projectDelete")
	public String projectDelete(int projectNum, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =projectService.projectDelete(projectNum);
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}



	//Test
	//Client가 mypage에서 확인하는 myprojectList
	//@RequestMapping(value="projectView")
	/*public String clientPjList(ListInfo listInfo, Model model, ProjectDTO projectDTO, HttpSession session){
		System.out.println("Client ProjectList");
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int totalCount = projectService.clientPjCount(listInfo, memberDTO);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		List<ProjectDTO> ar = projectService.clientPjList(listInfo, memberDTO);
		
		System.out.println("totalCount="+totalCount);
		System.out.println("arsize="+ar.size());
	
		model.addAttribute("list", ar);
		model.addAttribute("type", "list");
		model.addAttribute("pjcount", totalCount);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("member", memberDTO);
		
		return "project/clientProjectList";
	}*/
	


	
}

package com.flu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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


		model.addAttribute("listInfo", listInfo);
		model.addAttribute("member", memberDTO);
	
		
		
		return "project/projectList";
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
				
		System.out.println("projectListInner의 ar="+ar);
		System.out.println("inner에서 detailCategory=="+ar.get(0).getDetailCategory());
		
		//System.out.println("chekcLsit찍어보자="+checkList.size());
		System.out.println("=====================");
		System.out.println("detailCategory="+ar.get(0).getDetailCategory());
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
	public void projectView(Integer projectNum, Model model, HttpSession session, MemberDTO memberDTO, ListInfo listInfo){
		System.out.println("projectView");
		if(projectNum==null){
			projectNum=1;
		}
		
		ProjectDTO projectDTO = projectService.projectView(projectNum);

		
		System.out.println("session의 사진을 불러와보자");

		memberDTO = (MemberDTO)session.getAttribute("member");
		
		/*int contractResult = projectService.contractCount(projectDTO);*/
		/*System.out.println("계약한 갯수="+contractResult);
		*/
		System.out.println("프로젝트작성자-asdf-"+projectDTO.getEmail());
		System.out.println("프로젝트 이름="+projectDTO.getName());
		model.addAttribute("dto", projectDTO);
		model.addAttribute("member", memberDTO);
		/*model.addAttribute("conCount", contractResult);
*/
			
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
		
		projectDTO = projectService.projectView(projectDTO.getProjectNum());
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
		}
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//delete
	@RequestMapping(value="projectDelete")
	public String projectDelete(ProjectDTO projectDTO, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =projectService.projectDelete(projectDTO.getProjectNum());
		//관리자가 지웠을때 관리자 리스트로도 가게하려고 state가 필요해서 DTO로 크게 받는게 어떨까요?
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		String path = "redirect:/project/projectList";
		
		if(projectDTO.getState().equals("fail")){ //만약 넘어온 상태가 fail이라면 관리자 모집실패 페이지로 주소 변경
			path = "redirect:/checkProject/checkProjectFailList";
		}
		
		return path;
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

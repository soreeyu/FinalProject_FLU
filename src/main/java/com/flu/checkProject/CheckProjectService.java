package com.flu.checkProject;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.client.ClientDAO;
import com.flu.client.ClientDTO;
import com.flu.member.MemberDTO;
import com.flu.profile.Evaluation;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

import oracle.net.aso.i;

@Service
public class CheckProjectService {

	@Inject
	private CheckProjectDAO checkProjectDAO;
	
	private void search(ProjectDTO projectDTO,String searchDate){
		if(projectDTO.getCategory()==null){
			projectDTO.setCategory("");
		}
		if(projectDTO.getDetailCategory()==null){
			projectDTO.setDetailCategory("");
		}
		if(projectDTO.getPlanState()==null){
			projectDTO.setPlanState("");
		}
		if(projectDTO.getName()==null){
			projectDTO.setName("");
		}
		if(projectDTO.getEmail()==null){
			projectDTO.setEmail("");
		}
		if(projectDTO.getStartDate()==null){
			projectDTO.setStartDate("");
		}else{
			if(!projectDTO.getStartDate().equals("")){
				projectDTO.setStartDate(projectDTO.getStartDate().replaceAll("-", "/").substring(2));
			}
		}
		if(projectDTO.getFinishDate()==null){
			projectDTO.setFinishDate("");
		}else{
			if(!projectDTO.getFinishDate().equals("")){
				projectDTO.setFinishDate(projectDTO.getFinishDate().replaceAll("-", "/").substring(2));
			}
		}
		
		Calendar ca = new GregorianCalendar(Locale.KOREA);
		ca.setTime(new Date());
		
		if(searchDate==null){
			projectDTO.setReg_date("91/12/11");
		}else if(searchDate.equals("")){
			projectDTO.setReg_date("91/12/11");
		}else if(searchDate.equals("week")){
			ca.add(Calendar.DAY_OF_YEAR, -7);
			System.out.println("1주전:"+ ca.getTime());
		}else if(searchDate.equals("month")){
			ca.add(Calendar.MONTH, -1);
			System.out.println("1달전:"+ ca.getTime());
		}else if(searchDate.equals("month3")){
			ca.add(Calendar.MONTH, -3);
			System.out.println("3달전:"+ ca.getTime());
		}else if(searchDate.equals("month6")){
			ca.add(Calendar.MONTH, -6);
			System.out.println("6달전:"+ ca.getTime());
		}else if(searchDate.equals("year")){
			ca.add(Calendar.YEAR, -1);
			System.out.println("1년전:"+ ca.getTime());
		}else{
			
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		
		if(searchDate==null){
			projectDTO.setReg_date("91/12/11");
			
		}else if(searchDate.equals("")){
			projectDTO.setReg_date("91/12/11");
			
		}else{
			projectDTO.setReg_date(simpleDateFormat.format(ca.getTime()));
			System.out.println("최종 검색 범위"+projectDTO.getReg_date());
			
		}
		
	}
	
	
	public List<ProjectDTO> checkList(ProjectDTO projectDTO,ListInfo listInfo,String searchDate) throws Exception{
		
		search(projectDTO, searchDate);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
			
			return checkProjectDAO.checkList(map);
		
	}
	
	public List<ProjectDTO> failList(ProjectDTO projectDTO,ListInfo listInfo,String searchDate){
		
		search(projectDTO, searchDate);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		
		return checkProjectDAO.failList(map);
	}
		
	public List<ProjectDTO> waitList(ProjectDTO projectDTO,ListInfo listInfo,String searchDate){
		
		
		search(projectDTO, searchDate);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		
		
		return checkProjectDAO.waitList(map);
	}
	
	public List<ProjectDTO> finishList(ProjectDTO projectDTO,ListInfo listInfo,String searchDate,List<String> projectList){
		
	
		search(projectDTO, searchDate);
		
		System.out.println("서비스-------------------------------------------");
		System.out.println("카테고리:"+projectDTO.getCategory());
		System.out.println("디테일카테고리:"+projectDTO.getDetailCategory());
		System.out.println("프로젝트명:"+projectDTO.getName());
		System.out.println("기간: "+projectDTO.getReg_date());
		System.out.println("프리랜서명:"+listInfo.getMemberName());
		System.out.println("프리랜서 종류:"+listInfo.getType());
		System.out.println("시작일:"+projectDTO.getStartDate());
		System.out.println("종료일:"+projectDTO.getFinishDate());
		
		if(projectList.size()==0){
			System.out.println("null 성공");
			projectList.add("99999999");
			
		}else{
			for(int i=0; i<projectList.size();i++){
				System.out.println("프로젝트 넘버:"+projectList.get(i));
			}
		}
		

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		map.put("projectList", projectList);
		map.put("board", "finish");
		
		
		return checkProjectDAO.finishList(map);
		
	}

	
	

	public List<String> supportList(ListInfo listInfo){
		return checkProjectDAO.supportList(listInfo);
	}
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
	

	
	
}

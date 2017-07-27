package com.flu.checkProject;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.client.ClientDAO;
import com.flu.client.ClientDTO;
import com.flu.member.MemberDTO;
import com.flu.profile.Evaluation;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Service
public class CheckProjectService {

	@Inject
	private CheckProjectDAO checkProjectDAO;
	
	public List<ProjectDTO> checkList(Map<String, Object> map) throws Exception{
		
			if(!((ProjectDTO)map.get("projectDTO")).getStartDate().equals("")){
				((ProjectDTO)map.get("projectDTO")).setStartDate(((ProjectDTO)map.get("projectDTO")).getStartDate().replaceAll("-", "/").substring(2));
			}
			
			if(!((ProjectDTO)map.get("projectDTO")).getFinishDate().equals("")){
				((ProjectDTO)map.get("projectDTO")).setFinishDate(((ProjectDTO)map.get("projectDTO")).getFinishDate().replaceAll("-", "/").substring(2));
				
			}
			if(!((ProjectDTO)map.get("projectDTO")).getReg_date().equals("")){	
				((ProjectDTO)map.get("projectDTO")).setReg_date(((ProjectDTO)map.get("projectDTO")).getReg_date().replaceAll("-", "/").substring(2));
				
			}
			
			return checkProjectDAO.checkList(map);
		
	}
	
/*	public List<ProjectDTO> failList(ListInfo listInfo){
		return checkProjectDAO.failList(listInfo);
	}
		*/
	public List<ProjectDTO> waitList(Map<String, Object> map){
		
		if(!((ProjectDTO)map.get("projectDTO")).getStartDate().equals("")){
			((ProjectDTO)map.get("projectDTO")).setStartDate(((ProjectDTO)map.get("projectDTO")).getStartDate().replaceAll("-", "/").substring(2));
		}
		
		if(!((ProjectDTO)map.get("projectDTO")).getFinishDate().equals("")){
			((ProjectDTO)map.get("projectDTO")).setFinishDate(((ProjectDTO)map.get("projectDTO")).getFinishDate().replaceAll("-", "/").substring(2));
			
		}
		if(!((ProjectDTO)map.get("projectDTO")).getReg_date().equals("")){	
			((ProjectDTO)map.get("projectDTO")).setReg_date(((ProjectDTO)map.get("projectDTO")).getReg_date().replaceAll("-", "/").substring(2));
			
		}
		
		return checkProjectDAO.waitList(map);
	}
	
	public List<ProjectDTO> finishList(Map<String, Object> map){
		
		if(!((ProjectDTO)map.get("projectDTO")).getStartDate().equals("")){
			((ProjectDTO)map.get("projectDTO")).setStartDate(((ProjectDTO)map.get("projectDTO")).getStartDate().replaceAll("-", "/").substring(2));
		}
		
		if(!((ProjectDTO)map.get("projectDTO")).getFinishDate().equals("")){
			((ProjectDTO)map.get("projectDTO")).setFinishDate(((ProjectDTO)map.get("projectDTO")).getFinishDate().replaceAll("-", "/").substring(2));
			
		}
		if(!((ProjectDTO)map.get("projectDTO")).getReg_date().equals("")){	
			((ProjectDTO)map.get("projectDTO")).setReg_date(((ProjectDTO)map.get("projectDTO")).getReg_date().replaceAll("-", "/").substring(2));
			
		}
		
		return checkProjectDAO.finishList(map);
	}

	
	
	
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
	

	
	
}

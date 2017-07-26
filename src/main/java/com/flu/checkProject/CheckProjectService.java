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
	
		List<ProjectDTO> ar = checkProjectDAO.checkList(map);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YY-MM-dd");
		
		System.out.println(ar.get(0).getStartDate().substring(0,ar.get(0).getStartDate().toString().lastIndexOf(" ")));
		
		return null;
		
	}
	
/*	public List<ProjectDTO> failList(ListInfo listInfo){
		return checkProjectDAO.failList(listInfo);
	}
	
	public List<ProjectDTO> waitList(ListInfo listInfo){
		return checkProjectDAO.waitList(listInfo);
	}
	
	public List<ProjectDTO> finishList(ListInfo listInfo){
		return checkProjectDAO.finishList(listInfo);
	}
	*/
	
	
	
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
	

	
	
}

package com.flu.checkProject;

import java.util.List;

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
	
	public List<ProjectDTO> checkList(ListInfo listInfo){
		return checkProjectDAO.checkList(listInfo);
	}
	
	public List<ProjectDTO> failList(ListInfo listInfo){
		return checkProjectDAO.failList(listInfo);
	}
	
	public List<ProjectDTO> waitList(ListInfo listInfo){
		return checkProjectDAO.waitList(listInfo);
	}
	
	public List<ProjectDTO> finishList(ListInfo listInfo){
		return checkProjectDAO.finishList(listInfo);
	}
	
	
	
	
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
	

	
	
}

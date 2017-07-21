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
	
	public List<ProjectDTO> doneList(ListInfo listInfo){
		return checkProjectDAO.doneList(listInfo);
	}
	
	public List<ProjectDTO> finishList(ListInfo listInfo){
		return checkProjectDAO.finishList(listInfo);
	}
	
	
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
	public List<ProjectDTO> listCash(ListInfo listInfo){
		return checkProjectDAO.listCash(listInfo);
	}
	

	
	
}

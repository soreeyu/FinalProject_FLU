package com.flu.checkProject;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Service
public class CheckProjectService {

	@Inject
	private CheckProjectDAO checkProjectDAO;
	
	public List<ProjectDTO> list(ListInfo listInfo){
		return checkProjectDAO.list(listInfo);
	}
	
	public int update(ProjectDTO projectDTO){
		return checkProjectDAO.update(projectDTO);
	}
	
}

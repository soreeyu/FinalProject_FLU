package com.flu.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;

@Controller
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	
	public int projectWrite(ProjectDTO projectDTO){
		return 0;
	}
	
}

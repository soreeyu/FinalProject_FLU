package com.flu.test;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.project.ProjectDAO;
import com.flu.project.ProjectDTO;
import com.flu.reply.ReplyDAO;
import com.flu.reply.ReplyDTO;
import com.flu.util.ListInfo;

public class ProjectTest extends MyAbstract {

	@Inject
	private ProjectDAO projectDAO;
	
	@Test
	public void test() {
	ProjectDTO projectDTO = new ProjectDTO();
	List<ProjectDTO> ar =  projectDAO.quickList(projectDTO);
	
	assertEquals(5, ar.size());
	}

}

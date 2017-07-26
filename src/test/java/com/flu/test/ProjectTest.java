package com.flu.test;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.project.ProjectDAO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;


public class ProjectTest extends MyAbstract {


	@Inject
	private ProjectDAO projectDAO;
	
	@Test
	public void test() {
		
		ProjectDTO projectDTO = new ProjectDTO();
		
		
		java.util.Date uDate = new java.util.Date();
		java.sql.Date sDate = new java.sql.Date(uDate.getTime());
		
		
		projectDTO.setProjectNum(1);
		projectDTO.setCategory("ca");
		projectDTO.setDetailCategory("aaa");
		projectDTO.setName("name");
		projectDTO.setPeriod("123");
		projectDTO.setStartDate(sDate);
		projectDTO.setBudget(123000);
		projectDTO.setPlanState("idea");
		projectDTO.setContents("contents");
		projectDTO.setSkill("skill");
		projectDTO.setFinishDate(sDate);
		projectDTO.setMeetKind("meetkind");
		projectDTO.setExp("exp");
		projectDTO.setState("state");
		projectDTO.setEmail("email");
		projectDTO.setQuick(1);
		projectDTO.setfName("fffname");
		projectDTO.setoName("oooname");
		projectDTO.setAddr_detail("addr_detail");
		projectDTO.setAddr_main("addr_main");
		projectDTO.setAddr_num("addr_num");
		projectDTO.setReg_date(sDate);
		
		int result = projectDAO.projectUpdate(projectDTO);
		
		assertEquals(1, result);
		
	}

}

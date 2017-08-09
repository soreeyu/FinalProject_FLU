package com.flu.test;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.project.ProjectDAO;
import com.flu.project.ProjectDTO;
import com.flu.project.sell.PjSellDAO;
import com.flu.project.sell.PjSellDTO;
import com.flu.reply.ReplyDAO;
import com.flu.reply.ReplyDTO;
import com.flu.util.ListInfo;

public class ProjectTest extends MyAbstract {

	@Inject
	private PjSellDAO pjSellDAO;
	@Inject
	private ProjectDAO projectDAO;
	
	@Test
	public void test() {
	PjSellDTO pjSellDTO = new PjSellDTO();
	
	pjSellDTO.setEmail("bobobo");
	pjSellDTO.setName("name");
	pjSellDTO.setPrice(10);
	pjSellDTO.setProjectNum(263);
	pjSellDTO.setContents("ddd");
	
	int result = projectDAO.updateProjectState(pjSellDTO);
			assertEquals(1, result);
	}

}

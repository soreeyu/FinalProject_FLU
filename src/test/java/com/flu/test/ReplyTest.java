package com.flu.test;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.project.ProjectDTO;
import com.flu.reply.ReplyDAO;
import com.flu.reply.ReplyDTO;
import com.flu.util.ListInfo;

public class ReplyTest extends MyAbstract {

	@Inject
	private ReplyDAO replyDAO;
	
	@Test
	public void test() {
		
		ReplyDTO replyDTO = new ReplyDTO();
		
		java.util.Date uDate = new java.util.Date();
		java.sql.Date sDate = new java.sql.Date(uDate.getTime());
		ListInfo listInfo = new ListInfo();
		ProjectDTO projectDTO = new ProjectDTO();
		/*replyDTO.setNum(2);
		replyDTO.setContents("bobae");
		replyDTO.setProjectNum(3000);
		replyDTO.setReg_date(sDate);
		replyDTO.setWriter("dd");
		replyDTO.setRef(0);
		replyDTO.setDepth(0);
		replyDTO.setStep(0);
		
		int result = replyDAO.replyUpdate(replyDTO);*/
		/*int result = replyDAO.replyCount(listInfo);*/
		projectDTO.setProjectNum(5000);
		/*replyDTO.setProjectNum(5000);*/
		int result = replyDAO.replyCount(listInfo, projectDTO);
		/*List<ReplyDTO> ar = replyDAO.replyList(listInfo, projectDTO);*/
			
		
		/*assertEquals(14, result);*/
		/*assertNotNull(ar);*/
		
	}

}

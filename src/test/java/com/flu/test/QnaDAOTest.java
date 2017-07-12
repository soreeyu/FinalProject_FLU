package com.flu.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.flu.checkMember.CheckMemberDTO;
import com.flu.checkMember.CheckMemberService;



public class QnaDAOTest extends MyAbstractTest{


	@Inject
	private SqlSession sqlSession;
	
	public void test(){
		assertNotNull(sqlSession);
	}
	
	
	
	@Inject
	private CheckMemberService checkMemberService;
	
/*	@Test
	public void test2(){
		CheckMemberDTO checkMemberDTO = new CheckMemberDTO();
		checkMemberDTO.setEmail("jk930@naver.com");
		checkMemberDTO.setFname("fname");
		checkMemberDTO.setOname("oname");
		checkMemberDTO.setName("suck");
		try {
			int result = checkMemberService.insertTran(checkMemberDTO);
			
			assertEquals(1, result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}*/
	
	
	
	
	
	
}

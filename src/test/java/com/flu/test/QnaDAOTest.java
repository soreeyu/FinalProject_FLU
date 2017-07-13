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



public class QnaDAOTest extends MyAbstract{


	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "MemberMapper.";
	
	public void test(){
		assertNotNull(sqlSession);
	}
	


}

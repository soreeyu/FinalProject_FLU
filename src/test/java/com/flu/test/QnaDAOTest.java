package com.flu.test;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;



public class QnaDAOTest extends MyAbstractTest{


	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "MemberMapper.";
	
	public void test(){
		assertNotNull(sqlSession);
	}
	
	@Test
	public void emailTest(){
		sqlSession.selectOne(NAMESPACE+"memberEmail", "jk930@naver.com");
	}
	
}

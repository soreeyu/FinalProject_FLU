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
	
	@Test
	public void test(){
		assertNotNull(sqlSession);
	}
	
}

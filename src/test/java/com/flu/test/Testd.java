package com.flu.test;

import static org.junit.Assert.assertNotNull;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

public class Testd extends MyAbstract {

	@Inject
	private SqlSession sqlSession;
	
	@Test
	public void test(){
		
		assertNotNull(sqlSession);
	}
	
}

package com.flu.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.flu.checkMember.CheckMemberDTO;
import com.flu.checkMember.CheckMemberService;
import com.flu.reservation.ReservationDTO;



public class QnaDAOTest extends MyAbstract{


	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ReservationMapper.";
	
	@Test
	public void test(){
		
		
	}
	


}

package com.flu.test;

import static org.junit.Assert.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.junit.Test;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;

public class alarmTest  extends MyAbstract{

	@Inject
	AlarmService alarm;
	
	@Test
	public void test()throws Exception{
		AlarmDTO alarmDTO = new AlarmDTO();
		
		
		alarmDTO.setEmail("pkjuno@nate.com");
		alarmDTO.setContents("테스트입니다");
		
		
		
		assertNotNull(alarm.alarmInsert(alarmDTO));
	}

}

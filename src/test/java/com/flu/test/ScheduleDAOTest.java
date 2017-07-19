package com.flu.test;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.flu.member.MemberDTO;
import com.flu.schedule.ScheduleDAO;
import com.flu.schedule.client.ScheduleMainDTO;
import com.flu.schedule.client.ScheduleUnitDTO;

public class ScheduleDAOTest extends MyAbstract{
	
	@Autowired
	private ScheduleDAO scheduleDAO;

	
	public void test() {
		
		/*
		assertNotNull(scheduleDAO);
		System.out.println("scheduleDAO = "+scheduleDAO);
		*/
		
		
		
		java.util.Calendar cal = java.util.Calendar.getInstance(); //현재 시간 가져오기

		

		java.sql.Date sDate = new java.sql.Date(cal.getTimeInMillis());
		System.out.println("Calendar 이용 시간 = "+sDate);
		
		java.util.Date uDate = new java.util.Date();
		sDate = new java.sql.Date(uDate.getTime());
		System.out.println("utilDate 이용 시간 = "+sDate);
		

		ScheduleMainDTO scheduleMainDTO = new ScheduleMainDTO();
		scheduleMainDTO.setProjectNum(4000);

		scheduleMainDTO.setStartDate(sDate);
		scheduleMainDTO.setFinishDate(sDate);

		
		int result = scheduleDAO.insertMainSchedule(scheduleMainDTO);
		
		assertNotEquals(0, result);
		System.out.println("Test MainS insert result = "+result);
	}
	
	//@Test
	public void testCheck() {
		
		ScheduleMainDTO dto = scheduleDAO.checkSchedule(5000);
		//assertNotNull(dto);
		assertNull(dto);
		//System.out.println("scheduleNum= "+dto.getScheduleNum());
		
	}

	
	//@Test
	public void testInsertUnit(){
		ScheduleUnitDTO dto = new ScheduleUnitDTO();
		dto.setEmail("myeon01@flu.com");
		dto.setPartName("part1");
		dto.setScheduleNum(81);
		dto.setUnitStartDate("2017-07-01");
		dto.setUnitFinishDate("2017-07-30");
		dto.setUnitState("할일");
		dto.setUnitName("myeon1이 part1에서 할일2");
		dto.setUnitDescFileF("파일이름");
		dto.setUnitDescFileO("파일진짜이름");
		dto.setUnitDescribe("그것에 대한 상세 설명설명");
		int result = scheduleDAO.insertUnit(dto);
		System.out.println("result= "+result);
		assertNotEquals(0, result);
		
	}
	
	@Test
	public void testUserList(){
		List<MemberDTO> list = scheduleDAO.userList(81);
		assertNotNull(list);
	}
	
	
	
	

}

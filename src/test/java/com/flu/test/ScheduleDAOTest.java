package com.flu.test;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.flu.schedule.ScheduleDAO;
import com.flu.schedule.client.ScheduleMainDTO;

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
	
	@Test
	public void testCheck() {
		
		ScheduleMainDTO dto = scheduleDAO.checkSchedule(5000);
		//assertNotNull(dto);
		assertNull(dto);
		//System.out.println("scheduleNum= "+dto.getScheduleNum());
		
	}
	
	
	
	

}

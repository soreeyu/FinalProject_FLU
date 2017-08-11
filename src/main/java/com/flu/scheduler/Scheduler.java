package com.flu.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.flu.checkProject.CheckProjectDAO;


@Service
public class Scheduler {

	@Inject
	private CheckProjectDAO checkProjectDAO;
	
	//스케줄러
	@Scheduled(cron="0 0 0 * * *")
	public void makeFail(){
		
		Calendar ca = Calendar.getInstance();
		
		Date today = new Date(ca.getTimeInMillis());
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		
		String finishDate = simpleDateFormat.format(today);
		
		System.out.println("모집 마감일이"+finishDate+"인 놈들 다 fail할게요~");
		
		checkProjectDAO.makeFail(finishDate);
		
	}

}

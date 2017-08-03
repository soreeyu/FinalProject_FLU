package com.flu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.notice.NoticeDTO;
import com.flu.notice.NoticeService;
import com.flu.util.ListInfo;

/*@Controller
@RequestMapping(value="Notice/**")*/
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	//공지사항 LIST
	@RequestMapping(value="NoticeList", method=RequestMethod.GET)
	public void noticeList(ListInfo listInfo){
		
	} 
	
	//공지사항 VIEW
	@RequestMapping(value="NoticeView", method=RequestMethod.GET)
	public void noticeView(int num){
		
	}
	
	//곻지사항 INSERT
	@RequestMapping(value="NoticeInsert", method=RequestMethod.POST)
	public void noticeInsert(NoticeDTO noticeDTO){
		
	}
	
	//공지사항 UPDATE FORM
	@RequestMapping(value="NoticeUpdate", method=RequestMethod.GET)
	public void noticeUpdate(int num){
		//업데이트 처리를 하기 위해서 먼저 View 를 해온다.
	}
	//공지사항 UPDATE 처리
	@RequestMapping(value="NoticeUpdate", method=RequestMethod.POST)
	public void noticeUpdate(NoticeDTO noticeDTO){
			
	}
	
	//공지사항 DELETE
	@RequestMapping(value="NoticeDelete", method=RequestMethod.POST)
	public void noticeDelete(int num){
		
	}
	
	
}

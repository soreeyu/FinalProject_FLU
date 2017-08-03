package com.flu.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flu.util.ListInfo;
import com.flu.util.RowMaker;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	//공지사항 INSERT
	public int noticeInsert(NoticeDTO noticeDTO){
		return 0;
	}
	
	//공지사항 VIEW
	public NoticeDTO noticeView(int num){
		return null;
	}
	
	//공지사항  UPDATE
	public int noticeUpdate(NoticeDTO noticeDTO){
		return 0;
	}
	
	//공지사항 DELETE
	public int noticeDelete(int num){
		return 0;
	}
	
	//공지사항 LIST
	public List<NoticeDTO> noticeList(ListInfo listInfo){
		return null;
	}	
	
	
}

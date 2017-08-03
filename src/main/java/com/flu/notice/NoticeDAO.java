package com.flu.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flu.util.ListInfo;
import com.flu.util.RowMaker;



@Repository
public class NoticeDAO {
	//공지사항 DAO
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="NoticeMapper.";
	
	
	//공지사항 INSERT
	public int noticeInsert(NoticeDTO noticeDTO){
		return 0;
	}
	
	//공지사항 VIEW
	public NoticeDTO noticeView(int num){
		//mapper에서 조회수 업데이트 하는 쿼리문 추가
		
		return null;
	}
	
	//공지사항 UPDATE
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

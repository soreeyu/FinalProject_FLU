package com.flu.test;

import static org.junit.Assert.assertNotNull;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.flu.meetRoom.MeetRoomDTO;
import com.flu.meetRoom.MeetRoomServiceImpl;

public class Testd extends MyAbstract {

	@Inject
	private SqlSession sqlSession;
	
	@Test
	public void test(){
		MeetRoomDTO meetRoomDTO = new MeetRoomDTO();
		

		meetRoomDTO.setName("test");
		meetRoomDTO.setContents("test");
		meetRoomDTO.setTime("연중무휴");
		meetRoomDTO.setFname("ddd");
		meetRoomDTO.setOname("dddd");
		meetRoomDTO.setAddr_num("dd");
		meetRoomDTO.setAddr_main("dddd");
		meetRoomDTO.setAddr_detail("ddddddd");
		meetRoomDTO.setHoliday("nono");
		meetRoomDTO.setHomePage("nnnnnn");
		
		
		
		assertNotNull(sqlSession.insert("MeetRoomMapper.MeetInsert", meetRoomDTO));
	}
	
}

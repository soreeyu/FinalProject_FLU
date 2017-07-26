package com.flu.meetRoom;

import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.room.RoomDAO;
import com.flu.room.RoomDTO;

@Repository
public class MeetRoomDAOImpl implements RoomDAO{

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "MeetRoomMapper.";

	
	@Override
	public List<RoomDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"MeetList", listInfo);
	}
	
	
	@Override
	public int insert(RoomDTO room) throws Exception {
		//업체 등록하는 메서드
		return sqlSession.insert(NAMESPACE+"MeetInsert", room);
	}
	

	@Override
	public int update(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"MeetUpdate", room);
	}

	@Override
	public RoomDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"MeetView", num);
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"MeetDelete", num);
	}
	
	public List<RoomDTO> eachSelect(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"MeetDelete_eachRoom", num);
	}
	public int delete2(int num) throws Exception{
		// 업체 삭제시 자동으로 업체에 속해있는 방들을 삭제
		return sqlSession.delete(NAMESPACE+"EachDelete", num);
	}
	
	//업체 페이징을 위한 카운트 가져오기 // 검색추가를 위해  listinfo를 추가로 넣어야함 일단 보류
	public int count() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"MeetRoomCount");
	}
	
	
	
	
}

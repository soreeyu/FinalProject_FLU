package com.flu.eachRoom;

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
public class EachRoomDAOImpl implements RoomDAO{

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "EachRoomMapper.";

	
	public List<RoomDTO> list(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"EachList", num);
	}

	@Override
	public int insert(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"EachInsert", room);
	}

	@Override
	public int update(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"EachUpdate", room);
	}

	@Override
	public RoomDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"EachView", num);
	}

	@Override
	public int delete(int num) throws Exception {
		// 세부공간 하나 직접삭제
		return sqlSession.delete(NAMESPACE+"EachDelete", num);
	}
	
	@Override
	public List<RoomDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}

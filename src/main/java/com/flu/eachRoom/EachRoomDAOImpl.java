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

	@Override
	public List<RoomDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RoomDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}

package com.flu.meetRoom;

import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flu.room.RoomDTO;
import com.flu.room.RoomService;

@Service
public class MeetRoomServiceImpl implements RoomService{

	@Inject
	private MeetRoomDAOImpl meetRoomDAO;
	
	@Override
	public List<RoomDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RoomDTO view(RoomDTO room) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int count(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
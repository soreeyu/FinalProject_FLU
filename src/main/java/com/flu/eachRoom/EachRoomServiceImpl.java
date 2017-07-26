package com.flu.eachRoom;

import com.flu.util.ListInfo;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flu.meetRoom.MeetRoomDTO;
import com.flu.room.RoomDTO;
import com.flu.room.RoomService;

@Service
public class EachRoomServiceImpl implements RoomService{

	@Inject
	private EachRoomDAOImpl eachRoomDAO;
	
	
	public List<RoomDTO> list(int num) throws Exception {
		// TODO Auto-generated method stub
		return eachRoomDAO.list(num);
	}

	@Override
	public int insert(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		// TODO Auto-generated method stub
		return eachRoomDAO.insert(room);
	}

	@Override
	public int update(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		// TODO Auto-generated method stub
		return eachRoomDAO.update(room);
	}

	@Override
	public RoomDTO view(int num) throws Exception {
		// TODO Auto-generated method stub
		return eachRoomDAO.view(num);
	}

	@Override
	public int delete(int num) throws Exception {
		
		return eachRoomDAO.delete(num);
	}
	
	@Override
	public List<RoomDTO> list(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public MeetRoomDTO time(int num) throws Exception{
		return eachRoomDAO.time(num);
	}
	
	
	
	
}

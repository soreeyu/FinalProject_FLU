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
		listInfo.makeRow();
		
		return meetRoomDAO.list(listInfo);
	}

	@Override
	public int insert(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		
		return meetRoomDAO.insert(room );
	}

	@Override
	public int update(RoomDTO room,MultipartFile multi,String realPath) throws Exception {
		// TODO Auto-generated method stub
		return meetRoomDAO.update(room);
	}

	@Override
	public RoomDTO view(int num) throws Exception {
		
		return meetRoomDAO.view(num);
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return meetRoomDAO.delete(num);
	}
	
	public List<RoomDTO> eachSelect(int num) throws Exception{
		return meetRoomDAO.eachSelect(num);
	}
	public int count(ListInfo listInfo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int delete2(int num) throws Exception {
		return meetRoomDAO.delete2(num);
	}
	
}

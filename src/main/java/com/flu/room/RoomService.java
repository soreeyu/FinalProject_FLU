package com.flu.room;

import com.flu.util.ListInfo;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface RoomService {
	
	//list
	public List<RoomDTO> list(ListInfo listInfo) throws Exception;

	//insert
	public int insert(RoomDTO room,MultipartFile multi,String realPath) throws Exception;
	
	//update
	public int update(RoomDTO room,MultipartFile multi,String realPath) throws Exception;

	//view
	public RoomDTO view(RoomDTO room) throws Exception;
	
	//delete
	public int delete(int num) throws Exception;
	
}

package com.flu.room;

import com.flu.util.ListInfo;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RoomDAO {
	
	//list
	public List<RoomDTO> list(ListInfo listInfo) throws Exception;
	
	//insert
	public int insert(RoomDTO room) throws Exception;
	
	//update
	public int update(RoomDTO room) throws Exception;

	//view
	public RoomDTO view(int num) throws Exception;
	
	//delete
	public int delete(int num) throws Exception;
	
	
	//count는 meetRoom 업체만 필요, each 각 룸은 페이징 불필요 
	
}

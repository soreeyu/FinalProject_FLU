package com.flu.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlaramService {

	@Autowired
	private AlarmDAO alaramDAO;
	
	//알람 INSERT
	public int alaramInsert(AlarmDTO alaramDTO){
		return 0;
	}
	
	//알람 LIST
	public List<AlarmDTO> alaramList(){
		return null;
	}
	
	//알람 DELETE
	public int alaramDelete(int num){
		return 0;
	}
}

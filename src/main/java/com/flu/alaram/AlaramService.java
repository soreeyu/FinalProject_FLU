package com.flu.alaram;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlaramService {

	@Autowired
	private AlaramDAO alaramDAO;
	
	//알람 INSERT
	public int alaramInsert(AlaramDTO alaramDTO){
		return 0;
	}
	
	//알람 LIST
	public List<AlaramDTO> alaramList(){
		return null;
	}
	
	//알람 DELETE
	public int alaramDelete(int num){
		return 0;
	}
}

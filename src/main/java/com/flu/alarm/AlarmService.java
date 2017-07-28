
package com.flu.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {

	@Autowired
	private AlarmDAO alarmDAO;
	
	//알람 INSERT
	public int alarmInsert(AlarmDTO alarmDTO) throws Exception{
		return alarmDAO.alarmInsert(alarmDTO);
	}
	
	//알람 LIST
	public List<AlarmDTO> alarmList(AlarmDTO alarmDTO) throws Exception{
		return alarmDAO.alarmList(alarmDTO);
	}
	
	//알람 DELETE
	public int alarmDelete(int num) throws Exception{
		return 0;
	}
}
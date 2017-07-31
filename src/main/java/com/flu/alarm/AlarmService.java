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
		return alarmDAO.alarmDelete(num);
	}
	
	//읽지 않은 알람 뿌려주기
	public AlarmDTO alarmCount(AlarmDTO alarmDTO) throws Exception{
		return alarmDAO.alarmCount(alarmDTO);
	}
	//알람 카운트 업데이트
	public int alarmCountUpdate(AlarmDTO alarmDTO) throws Exception{
		return alarmDAO.alarmCountUpdate(alarmDTO);
	}
}

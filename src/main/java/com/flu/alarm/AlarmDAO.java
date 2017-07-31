package com.flu.alarm;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flu.util.ListInfo;

@Repository
public class AlarmDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="AlarmMapper.";
	
	//알람 INSERT
	public int alarmInsert(AlarmDTO alarmDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"AlarmInsert", alarmDTO);
	}
	
	//알람 LIST
	public List<AlarmDTO> alarmList(AlarmDTO alarmDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"AlarmList", alarmDTO);
	}
	
	//알람 DELETE
	public int alarmDelete(Integer num) throws Exception{
		return sqlSession.delete(NAMESPACE+"AlarmDelete", num);
	}
	
	//헤더에 읽지 않은 알람 보여주기
	public int alarmCount(AlarmDTO alarmDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"AlarmCount", alarmDTO);
	}
	//알람 카운트 업데이트
	public int alarmCountUpdate(AlarmDTO alarmDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"AlarmCountUpdate", alarmDTO);
	}
}

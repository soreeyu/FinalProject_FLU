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
	public int alaramInsert(AlarmDTO alaramDTO){
		return 0;
	}
	
	//알람 LIST
	public List<AlarmDTO> alaramList(ListInfo listInfo){
		return null;
	}
	
	//알람 DELETE
	public int alaramDelete(int num){
		return 0;
	}
	
}

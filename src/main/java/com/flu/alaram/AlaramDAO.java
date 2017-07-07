package com.flu.alaram;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flu.util.ListInfo;

@Repository
public class AlaramDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="AlaramMapper.";
	
	//알람 INSERT
	public int alaramInsert(AlaramDTO alaramDTO){
		return 0;
	}
	
	//알람 LIST
	public List<AlaramDTO> alaramList(ListInfo listInfo){
		return null;
	}
	
	//알람 DELETE
	public int alaramDelete(int num){
		return 0;
	}
	
}

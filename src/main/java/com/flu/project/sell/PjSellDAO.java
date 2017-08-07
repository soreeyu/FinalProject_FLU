package com.flu.project.sell;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.util.ListInfo;

@Repository
public class PjSellDAO {
	

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ProjectMapper.";

	

	public int pjsellInsert(PjSellDTO pjSellDTO){
		System.out.println("pjsellinsert-dao");
		return sqlSession.insert(NAMESPACE+"insertSellProject", pjSellDTO);
	}
	
	
	

	public int pjsellDelete(int num){
		return 0;
	}
	

	public PjSellDTO pjsellView(int num){
		return null;
	}
	

	public List<PjSellDTO> pjsellList(){
		return null;
	}
	
	//
	public int pjsellCount(ListInfo listInfo){
		return 0;
	}
	
}

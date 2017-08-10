package com.flu.project.sell;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Repository
public class PjSellDAO {
	

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ProjectMapper.";

	
	//pjsell Insert
	public int pjsellInsert(PjSellDTO pjSellDTO){
		System.out.println("pjsellinsert-dao");
		return sqlSession.insert(NAMESPACE+"insertSellProject", pjSellDTO);
	}
	
	//pjsell에 등록이 되어있는지 체크
	public int checkSellProject(PjSellDTO pjSellDTO){
		return sqlSession.selectOne(NAMESPACE+"checkSellProject", pjSellDTO);
	}
	
	//pjsell에서 삭제
	public int deleteSellProject(int num){
		return sqlSession.delete(NAMESPACE+"deleteSellProject", num);
	}
	

	//pjsell의 내용 가져오기
	public PjSellDTO pjsellInfo(ProjectDTO projectDTO){
		int pjnum = projectDTO.getProjectNum();
		return sqlSession.selectOne(NAMESPACE+"pjsellInfo", pjnum);
	}
	

	public List<PjSellDTO> pjsellList(){
		return null;
	}
	
	//
	public int pjsellCount(ListInfo listInfo){
		return 0;
	}
	
}

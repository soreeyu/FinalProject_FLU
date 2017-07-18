package com.flu.client;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDTO;
import com.flu.profile.Evaluation;

@Repository
public class ClientDAO{
	
	@Inject
	private SqlSession sqlsession;
	private final String NAMESPACE = "ClientMapper.";
	
	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	public int clientInsert2(ClientDTO clientDTO){
	
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){
		
		return 0;
	}
	
	
	
	
	//대금관리에서 클라이언트 정보 가지고오기
	
	public MemberDTO memberView(String email){
		return sqlsession.selectOne(NAMESPACE+"memberView",email);
	}

	public ClientDTO clientView(String email){
		return sqlsession.selectOne(NAMESPACE+"clientView",email);
	}
	
	public Evaluation evaluationView(String email){
		return sqlsession.selectOne(NAMESPACE+"evaluationView",email);
	}
	
	
	
}

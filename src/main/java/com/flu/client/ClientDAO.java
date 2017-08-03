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
	
	//클라이언트 정보 추가
	public int clientInsert(ClientDTO clientDTO){
		
		return sqlsession.insert(NAMESPACE+"clientInsert", clientDTO);
	}
	
	//클라이언트 정보 수정
	public int clientUpdate(ClientDTO clientDTO){
		
		return sqlsession.update(NAMESPACE+"clientUpdate", clientDTO);
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

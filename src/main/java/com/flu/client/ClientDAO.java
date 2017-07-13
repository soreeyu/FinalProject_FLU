package com.flu.client;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

@Repository
public class ClientDAO{
	
	@Inject
	private SqlSession sqlsession;
	


	
	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	public int clientInsert2(ClientDTO clientDTO){
	
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){
		
		return 0;
	}
	
	
	
}

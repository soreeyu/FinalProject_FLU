package com.flu.client;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDAO;
import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

@Repository
public class ClientDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "MemberMapper.";

	@Override
	//회원 가입
	public int memberInsert(MemberDTO memberDTO) {
		int result = sqlsession.insert(NAMESPACE+"memberInsert", memberDTO);
		return result;
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO memberView(String email) {
		return sqlsession.selectOne(NAMESPACE+"memberView", email);
	}

	@Override
	public List<MemberDTO> memberList(RowMaker rowmaker) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberDelete(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	public int clientInsert2(ClientDTO clientDTO){
	
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){
		
		return 0;
	}
	
	//이메일 인증 시 난수 저장 , 인증 성공시 값이 1로 변경
	public int emailck(MemberDTO memberDTO){
		
		sqlsession.update(NAMESPACE+"emailUpdate", memberDTO);
		
		return 3;
	}
	
	//이메일 중복확인
	public String jungbok(String email){
		System.out.println(sqlsession.selectOne(NAMESPACE+"memberEmail", email));
		return sqlsession.selectOne(NAMESPACE+"memberEmail", email); // 이메일이 없을시 값이 없는 것 처리해야함
	}
}

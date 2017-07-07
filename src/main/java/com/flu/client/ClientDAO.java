package com.flu.client;

import java.util.List;

import com.flu.member.MemberDAO;
import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

public class ClientDAO implements MemberDAO{

	@Override
	public int memberInsert(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO memberView(String email) {
		// TODO Auto-generated method stub
		return null;
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
}

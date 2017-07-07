package com.flu.member;

import java.util.List;

import com.flu.util.RowMaker;

public interface MemberDAO {

	//멤버 회원가입
	public int memberInsert(MemberDTO memberDTO);
	
	//계정 정보수정
	public int memberUpdate(MemberDTO memberDTO);
	
	//계정 정보보기
	public MemberDTO memberView(String email);
	
	//회원리스트
	public List<MemberDTO> memberList(RowMaker rowmaker);
	
	//회원 탈퇴
	public int memberDelete(String email);
}

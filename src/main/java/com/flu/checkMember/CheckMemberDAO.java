package com.flu.checkMember;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDTO;
import com.flu.util.ListInfo;

@Repository
public class CheckMemberDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "CheckMemberMapper.";
	
	//0:신원미상, 1:접수중, 2:신원확인
	
	//insert 신원확인 올리기, update 멤버의 신원확인 수정
	public int insert(CheckMemberDTO checkMemberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert",checkMemberDTO);
	}
	
	//list 신원확인 요청리스트로 name, email 만 뿌려주기 
	public List<CheckMemberViewDTO> list(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"list",listInfo);
	}
	
	//신원인증을 위한 폼 들어갈때 약간의 기본정보 들고와서 뿌려주기
	public MemberDTO view(String email){
		return sqlSession.selectOne(NAMESPACE+"view",email);
	}
	
	//view 눌러서 들어가면 view에서 email로 member개인정보 불러오기
	public CheckMemberViewDTO checkView(String email){
		return sqlSession.selectOne(NAMESPACE+"checkView",email);
	}
	
	//신원확인상태를 바꿔주는 메소드
	public int checkUpdate(MemberDTO memberDTO){
		return sqlSession.update(NAMESPACE+"checkUpdate",memberDTO);
	}

	//체크멤버에서 지워버리기
	public int delete(String email){
		return sqlSession.delete(NAMESPACE+"delete", email);
	}
	

	
	//loginTest
	public MemberDTO loginTest(MemberDTO memberDTO){
		return sqlSession.selectOne(NAMESPACE+"loginTest",memberDTO);
	}
	
	
	
}

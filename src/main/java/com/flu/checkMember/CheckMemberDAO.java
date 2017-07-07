package com.flu.checkMember;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CheckMemberDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "CheckMemberMapper.";
	
	//insert 신원확인 올리기
	public int insert(CheckMemberDTO checkMemberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert",checkMemberDTO);
	}
	
	
	
	//list 신원확인 요청리스트로 name, email 만 뿌려주기 

	
	
	//view 눌러서 들어가면 view에서 email로 member개인정보 불러오기
	
	
	
	// update / member의 AuthenticState필드를 확인 했다고 update하면되지
	
	
	
}

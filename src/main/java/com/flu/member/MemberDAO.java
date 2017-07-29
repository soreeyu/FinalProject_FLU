package com.flu.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.util.RowMaker;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private final String NAMESPACE = "MemberMapper.";
	private final String NAMESPACE2 = "FreelancerMapper.";


	//회원 가입
	public int memberInsert(MemberDTO memberDTO) {
		int result = sqlSession.insert(NAMESPACE+"memberInsert", memberDTO);
			sqlSession.insert(NAMESPACE2+"freelancerInsert", memberDTO.getEmail());
		return result;
	}

	//계정 정보수정
	public int memberUpdate(MemberDTO memberDTO){
		
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}


	//회원리스트
	public List<MemberDTO> memberList(RowMaker rowmaker){

		return null;
	}

	//회원 탈퇴
	public int memberDelete(String email){

		return 0;
	}

	//회원 정보
	public MemberDTO memberView(String email) {
		System.out.println("view를 하러 왔음");
		return sqlSession.selectOne(NAMESPACE+"memberView", email);
	}

	//이메일 인증 시 난수 저장 , 인증 성공시 값이 1로 변경
	public int emailck(MemberDTO memberDTO){

		sqlSession.update(NAMESPACE+"emailUpdate", memberDTO);

		return 3;
	}

	//이메일 중복확인
	public String jungbok(String email){
		String email2 =sqlSession.selectOne(NAMESPACE+"freelancerEmail", email);
		System.out.println("이메일2:"+email2);
		System.out.println("이메일1:"+email);
		if(email.equals(email2)){
			System.out.println("중복임");
			if(sqlSession.selectOne(NAMESPACE+"memberEmail", email) == null){
				System.out.println("널임");
				return email2;
			}else{
				System.out.println("널아님");
				return sqlSession.selectOne(NAMESPACE+"memberEmail", email); // 이메일이 없을시 값이 없는 것 처리해야함
			}
		}else{
			System.out.println("아님");
			return sqlSession.selectOne(NAMESPACE+"memberEmail", email);
		}
	}


	//로그인
	public MemberDTO login(MemberDTO memberDTO){

		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
	
	
}

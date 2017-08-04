package com.flu.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.applicant.ApplicantDTO;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.project.ProjectDTO;
import com.flu.reservation.ReservationDTO;
import com.flu.util.ListInfo;
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
	public Map<String, Object> memberList(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freelancer", sqlSession.selectList(NAMESPACE+"memberList", "freelancer"));
		map.put("client", sqlSession.selectList(NAMESPACE+"memberList", "client"));
		
		return map;
	}

	//회원 탈퇴
	public int memberDelete(String email){

		return 0;
	}

	//회원 정보
	public CheckMemberViewDTO memberView(String email) {
		System.out.println("view를 하러 왔음");
		return sqlSession.selectOne(NAMESPACE+"memberView", email);
	}
	public MemberDTO memberView2(String email){
		return sqlSession.selectOne(NAMESPACE+"memberView2", email);
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
	//예약현황 리스트
	public List<ReservationDTO> memberReservedList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberReserved", memberDTO);
	}

	//예약현황 리스트 ( 관리자 전용 ) 
	public List<ReservationDTO> adminReservedList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"adminReserved", listInfo);
	}

	//예약리스트를 가져오기 위한 count
	public int totalCount() throws Exception{
		return sqlSession.selectOne("MeetRoomMapper.MeetRoomCount");

	}
	
	//진행중인 프로젝트 가져오기
	public List<ProjectDTO> memberProjectList_ING(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjectList_ING", email);
	}
	//지원한 프로젝트 리스트 가져오기
	public List<ProjectDTO> memberProjectList_APP(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjectList_APP", email);
	}
	//완료한 프로젝트 리스트 가져오기
	public List<ProjectDTO> memberProjectList_FIN(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjectList_FIN", email);
	}

	//검수중인 프로젝트 리스트 가져오기
	public List<ProjectDTO> memberProjecttList_CHK(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjecttList_CHK", email);
	}
	//지원자 모집중인 프로젝트 리스트 가져오기
	public List<ProjectDTO> memberProjectList_REC(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjectList_REC", email);
	}
	//진행중인 프로젝트 리스트 가져오기
	public List<ProjectDTO> memberProjectList_INGC(String email) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberProjectList_INGC", email);
	}
	
}

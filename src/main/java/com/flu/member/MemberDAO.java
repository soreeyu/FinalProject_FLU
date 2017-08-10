package com.flu.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.alarm.AlarmDTO;
import com.flu.applicant.ApplicantDTO;
import com.flu.checkMember.CheckMemberViewDTO;
import com.flu.project.ProjectDTO;
import com.flu.reservation.ReservationDTO;
//import com.flu.util.AES256Util;
import com.flu.util.ListInfo;
import com.flu.util.RowMaker;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private final String NAMESPACE = "MemberMapper.";	
	private final String NAMESPACE2 = "FreelancerMapper.";


	//회원 가입
	public int memberInsert(MemberDTO memberDTO)throws Exception {
		//AES256Util aes256Util = new AES256Util("FLU-Insert-encryption");
		
		String password = memberDTO.getPw();
		//String encpassword = aes256Util.aesEncode(password);
		//String decpassword = aes256Util.aesDecode(encpassword);
		System.out.println("원래 비밀번호 : "+password);
		//System.out.println("암호화된 비밀번호 : "+encpassword);
		//System.out.println("복호화된 비밀번호 : "+decpassword);
		
		//memberDTO.setPw(encpassword);
		memberDTO.setPw(password);
		
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

		return sqlSession.update(NAMESPACE+"emailUpdate", memberDTO);
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
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		//AES256Util aes256Util = new AES256Util("FLU-Insert-encryption");
		
		String password = memberDTO.getPw();
		//String encpassword = aes256Util.aesEncode(password);
		//String decpassword = aes256Util.aesDecode(encpassword);
		System.out.println("원래 비밀번호 : "+password);
		//System.out.println("암호화된 비밀번호 : "+encpassword);
		//System.out.println("복호화된 비밀번호 : "+decpassword);
		
		//memberDTO.setPw(encpassword);
		memberDTO.setPw(password);
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
	

	//계좌 등록/수정
	public int accountInsert(MemberDTO memberDTO){
		return sqlSession.update(NAMESPACE+"accountInsert", memberDTO);
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
	//진행중인 프로젝트 카운트(프리랜서)
	public int memberProjectCount_ING(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_ING", email);
	}
	//지원한 프로젝트 카운트(프리랜서)
	public int memberProjectCount_APP(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_APP", email);
	}
	//완료한 프로젝트 카운트(프리랜서)
	public int memberProjectCount_FIN(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_FIN", email);
	}
	//누적완료금액(프리랜서)
	public int memberProjectSumPay(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectSumPay", email);				
	}
	//등록한 프로젝트 카운트(클라이언트)
	public int memberProjectCount_CHK(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_CHK", email);
	}
	//진행중인 프로젝트 카운트(클라이언트)
	public int memberProjectCount_INGC(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_INGC", email);
	}
	//완료한 프로젝트 카운트(클라이언트)
	public int memberProjectCount_FINC(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectCount_FINC", email);
	}
	//누적완료금액(클라이언트)
	public int memberProjectSumBudget(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberProjectSumBudget", email);
	}
	//myflu에 뿌려질 알람 리스트
	public List<AlarmDTO> memberAlarmList(String email) throws Exception{
		System.out.println("email"+email);
		return sqlSession.selectList(NAMESPACE+"memberAlarmList", email);
	}
	//index에 뿌려질 등록된 회원 카운트
	public int memberCountTotal() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCountTotal");
	}
}

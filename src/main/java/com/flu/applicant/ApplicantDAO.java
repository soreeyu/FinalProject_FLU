package com.flu.applicant;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.project.ProjectDTO;

@Repository
public class ApplicantDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ApplicantMapper.";
	
	
	//지원자 List 불러오기
	public List<ApplicantDTO> list(int projectNum){	
		return sqlSession.selectList(NAMESPACE+"list", projectNum);
	}
	
	//APPLICANT 정보 + MEMBER 정보
	public List<ApplicantMemberDTO> applicantList(int projectNum){	
		return sqlSession.selectList(NAMESPACE+"applicantList", projectNum);
	}
	
	//지원자 List 불러오기
	public int ingCount(int projectNum){
			
		return sqlSession.selectOne(NAMESPACE+"ingCount", projectNum);
	}
	//chat List
	public List<ApplicantDTO> chatList(int projectNum){
		return sqlSession.selectList(NAMESPACE+"chatList", projectNum);
	}
	//지원자 update
	public int appUpdate(String email){
		return sqlSession.update(NAMESPACE+"update", email);
	}	
	public Integer checkApp(ApplicantDTO applicantDTO){
		return sqlSession.selectOne(NAMESPACE+"checkApp", applicantDTO);
	}	
	//지원하기누르면 추가되는 insert
	public int insertApplicant(ApplicantDTO applicantDTO){
		System.out.println("applicant-dao");
		return sqlSession.insert(NAMESPACE+"insertApplicant", applicantDTO);
	}
	//지원했는지 체크해보기
	public int checkApplicant(ApplicantDTO applicantDTO){
		System.out.println("checkApplicant-dao");
		System.out.println(applicantDTO.getEmail());
		return sqlSession.selectOne(NAMESPACE+"checkApplicant", applicantDTO);
	}
	//지원자 수 카운트하기
	public int countApplicant(int projectNum){
		return sqlSession.selectOne(NAMESPACE+"countApplicant", projectNum);
	}
	public int deleteApplicant(ApplicantDTO applicantDTO){
		System.out.println("delete-applicant-dao");
		System.out.println("email=="+applicantDTO.getEmail());
		System.out.println("projectNum=="+applicantDTO.getProjectNum());
	
		return sqlSession.delete(NAMESPACE+"deleteApplicant", applicantDTO);
	}
	
	//프로젝트 완료를 프리랜서가 눌렀을 때, applicant의 state-ing인 상태의 finishCheck를 0->1로 업데이트
	public int updateFinish(ApplicantDTO applicantDTO){
		System.out.println("updateFinish-dao");
		return sqlSession.update(NAMESPACE+"updateFinish", applicantDTO);
				
	}
	
	//프로젝트 view 진입시, 프로젝트 완료를 한 applicant인지 확인
	public ApplicantDTO checkFinish(ApplicantDTO applicantDTO){
		System.out.println("checkFinish-dao");
		return sqlSession.selectOne(NAMESPACE+"checkFinish", applicantDTO);
	}
	
	
	//해당프로젝트를 진행하는 applicant의 수
	public int countFinish(ApplicantDTO applicantDTO){
		return sqlSession.selectOne(NAMESPACE+"countfinish", applicantDTO);
	}
	
	//해당프로젝트를 진행하면서 finishCheck를 한 applicant의 수
	public int countCheck(ApplicantDTO applicantDTO){
		System.out.println("dao에서 projectNum=="+applicantDTO.getProjectNum());
		return sqlSession.selectOne(NAMESPACE+"countCheck", applicantDTO);
	}
	//클라이언트가 완료눌렀을 때, applicant상태를 finish로 바꿔주기
	public int updateState(ProjectDTO projectDTO){
		System.out.println("appli-dao-projectNum="+projectDTO.getProjectNum());
		return sqlSession.update(NAMESPACE+"updateState", projectDTO);
	}
}

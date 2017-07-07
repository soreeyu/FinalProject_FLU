package com.flu.freelancer;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.CheckMemberDTO;
import com.flu.member.MemberDAO;
import com.flu.member.MemberDTO;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.Skill;
import com.flu.util.RowMaker;

@Repository
public class FreelancerDAO implements MemberDAO{

	@Inject
	private SqlSession sqlSession;
	
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
	
	//프리랜서 정보 입력(추가로 입력 Update)
	public int freelancerInsert(FreelancerDTO freelancerDTO){
		
		return 0;
	}
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	public int portfolioInsert(PortFolio portFolio){
		
		return 0;
	}
	
	//포트폴리오 뷰
	public PortFolio portfolioView(String email){
		
		return null;
	}
	//포트폴리오 리스트
	public List<PortFolio> portfolioList(){
		
		return null;
	}
	//포트폴리오 수정
	public int portfolioUpdate(PortFolio portFolio){
			
		return 0;
	}
	//포트폴리오 삭제
	public int portfolioDelete(String email){
			
		return 0;
	}
	/************************** Skill *******************************/
	//보유기술 등록
	public int skillInsert(Skill skill){
		
		return 0;
	}
	
	//보유기술 뷰
	public Skill skillView(String email){
		
		return null;
	}
	
	//보유기술 리스트
	public List<Skill> skillList(){
		
		return null;
	}
	//보유기술 수정
	public int skillUpdate(Skill skill){
			
		return 0;
	}
	//보유기술 삭제
	public int skillDelete(String email){
			
		return 0;
	}
	/************************** Carrer *******************************/
	//경력 등록
	public int carrerInsert(Carrer carrer){
		
		return 0;
	}
	
	//경력 뷰
	public Carrer carrerView(String email){
		
		return null;
	}
	//경력 수정
	public int carrerUpdate(Carrer carrer){
			
		return 0;
	}
	//경력 삭제
	public int carrerDelete(String email){
			
		return 0;
	}
	/************************** Academic *******************************/
	//학력 등록
	public int academicInsert(Academic academic){
		
		return 0;
	}
	
	//학력 뷰
	public Academic academicView(String email){
		
		return null;
	}
	//학력 수정
	public int academicUpdate(Academic academic){
			
		return 0;
	}
	//학력 삭제
	public int academicDelete(String email){
			
		return 0;
	}
	/************************** License *******************************/
	//자격증 증록
	public int licenseInsert(License license){
		
		return 0;
	}
	
	//자격증 뷰
	public License licenseView(String email){
		
		return null;
	}
	//자격증 수정
	public int licenseUpdate(License license){
			
		return 0;
	}
	//자격증 삭제
	public int licenseDelete(String email){
			
		return 0;
	}
	/************************** Evaluation *******************************/
	//평가 정보 등록
	public int evaluationInsert(Evaluation evaluation){
		
		return 0;
	}
	
	//평가 정보 뷰
	public Evaluation evaluationView(String email){
		
		return null;
	}
	//평가 정보 수정
	public int evaluationUpdate(Evaluation evaluation){
		
		return 0;
	}
	//평가 정보 삭제
	public int evaluationDelete(String email){
		
		return 0;
	}
	/************************** Authentic *******************************/
	//신원확인
	public int authenticInsert(CheckMemberDTO checkMemberDTO){
		return 0;
	}
}
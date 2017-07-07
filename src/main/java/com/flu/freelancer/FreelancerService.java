package com.flu.freelancer;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.Skill;
import com.flu.profile.TypeInfo;

@Service
public class FreelancerService {

	@Inject
	private FreelancerDAO freelancerDAO;

	//프리랜서 등록
	public int freelancerInsert(FreelancerDTO freelancerDTO){
		return 0;
	}

	//프리랜서 리스트
	public List<FreelancerDTO> freelancerList(){
		return null;
	}

	//프리랜서 뷰
	public Map<String, Object> freelancerView(){

		/* 전부 있어야함
		FreelancerDTO;
		TypeInfo;
		PortFolio;
		Skill;
		Carrer;
		Academic;
		License;
		Evaluation;*/

		return null;
	}

	//프리랜서 수정
	public int freelancerUpdate(){
		return 0;
	}

	//프리랜서 삭제
	public int freelancerDelete(){
		return 0;
	}



	/////////////////////////////////////////////////////////////////////////////////////////////

	//프리랜서 정보 입력(추가로 입력 Update)
	public int freelancerInsert2(FreelancerDTO freelancerDTO){

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


}

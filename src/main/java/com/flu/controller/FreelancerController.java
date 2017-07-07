package com.flu.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.freelancer.FreelancerDTO;
import com.flu.freelancer.FreelancerService;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.Skill;

/*@Controller
@RequestMapping(value="/member/**")*/
public class FreelancerController {

	@Inject
	private FreelancerService freelancerService;

	//프리랜서 등록
	@RequestMapping(value="freeInsert", method=RequestMethod.POST)
	public int freelancerInsert(FreelancerDTO freelancerDTO){
		return 0;
	}

	//프리랜서 리스트
	@RequestMapping(value="freeList", method=RequestMethod.GET)
	public List<FreelancerDTO> freelancerList(){
		return null;
	}

	//프리랜서 뷰
	@RequestMapping(value="freeView", method=RequestMethod.GET)
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
	@RequestMapping(value="freeUpdate", method=RequestMethod.POST)
	public int freelancerUpdate(){
		return 0;
	}

	//프리랜서 삭제
	@RequestMapping(value="freeDelete", method=RequestMethod.GET)
	public int freelancerDelete(){
		return 0;
	}



	/////////////////////////////////////////////////////////////////////////////////////////////

	//프리랜서 정보 입력(추가로 입력 Update)
	@RequestMapping(value="freeInsert2", method=RequestMethod.POST)
	public int freelancerInsert2(FreelancerDTO freelancerDTO){

		return 0;
	}
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	@RequestMapping(value="portfolioInsert", method=RequestMethod.POST)
	public int portfolioInsert(PortFolio portFolio){

		return 0;
	}

	//포트폴리오 뷰
	@RequestMapping(value="portfolioView", method=RequestMethod.GET)
	public PortFolio portfolioView(String email){

		return null;
	}
	//포트폴리오 리스트
	@RequestMapping(value="portfolioList", method=RequestMethod.GET)
	public List<PortFolio> portfolioList(){

		return null;
	}
	//포트폴리오 수정
	@RequestMapping(value="portfolioUpdate", method=RequestMethod.POST)
	public int portfolioUpdate(PortFolio portFolio){

		return 0;
	}
	//포트폴리오 삭제
	@RequestMapping(value="portfolioDelete", method=RequestMethod.POST)
	public int portfolioDelete(String email){

		return 0;
	}
	/************************** Skill *******************************/
	//보유기술 등록
	@RequestMapping(value="skillInsert", method=RequestMethod.POST)
	public int skillInsert(Skill skill){

		return 0;
	}

	//보유기술 뷰
	@RequestMapping(value="skillView", method=RequestMethod.POST)
	public Skill skillView(String email){

		return null;
	}
	//보유기술 리스트
	@RequestMapping(value="skillList", method=RequestMethod.GET)
	public List<Skill> skillList(){

		return null;
	}
	//보유기술 수정
	@RequestMapping(value="skillUpdate", method=RequestMethod.POST)
	public int skillUpdate(Skill skill){

		return 0;
	}
	//보유기술 삭제
	@RequestMapping(value="skillDelete", method=RequestMethod.GET)
	public int skillDelete(String email){

		return 0;
	}
	/************************** Carrer *******************************/
	//경력 등록
	@RequestMapping(value="carrerInsert", method=RequestMethod.POST)
	public int carrerInsert(Carrer carrer){

		return 0;
	}

	//경력 뷰
	@RequestMapping(value="carrerView", method=RequestMethod.GET)
	public Carrer carrerView(String email){

		return null;
	}
	//경력 수정
	@RequestMapping(value="carrerUpdate", method=RequestMethod.POST)
	public int carrerUpdate(Carrer carrer){

		return 0;
	}
	//경력 삭제
	@RequestMapping(value="carrerDelete", method=RequestMethod.GET)
	public int carrerDelete(String email){

		return 0;
	}
	/************************** Academic *******************************/
	//학력 등록
	@RequestMapping(value="carrerInsert", method=RequestMethod.POST)
	public int academicInsert(Academic academic){

		return 0;
	}

	//학력 뷰
	@RequestMapping(value="carrerView", method=RequestMethod.GET)
	public Academic academicView(String email){

		return null;
	}
	//학력 수정
	@RequestMapping(value="carrerUpdate", method=RequestMethod.POST)
	public int academicUpdate(Academic academic){

		return 0;
	}
	//학력 삭제
	@RequestMapping(value="carrerDelete", method=RequestMethod.GET)
	public int academicDelete(String email){

		return 0;
	}
	/************************** License *******************************/
	//자격증 증록
	@RequestMapping(value="licenseInsert", method=RequestMethod.POST)
	public int licenseInsert(License license){

		return 0;
	}

	//자격증 뷰
	@RequestMapping(value="licenseView", method=RequestMethod.POST)
	public License licenseView(String email){

		return null;
	}
	//자격증 수정
	@RequestMapping(value="licenseUpdate", method=RequestMethod.GET)
	public int licenseUpdate(License license){

		return 0;
	}
	//자격증 삭제
	@RequestMapping(value="licenseDelete", method=RequestMethod.GET)
	public int licenseDelete(String email){

		return 0;
	}
	/************************** Evaluation *******************************/
	//평가 정보 등록
	@RequestMapping(value="evaluationInsert", method=RequestMethod.POST)
	public int evaluationInsert(Evaluation evaluation){

		return 0;
	}

	//평가 정보 뷰
	@RequestMapping(value="evaluationView", method=RequestMethod.GET)
	public Evaluation evaluationView(String email){

		return null;
	}
	//평가 정보 수정
	@RequestMapping(value="evaluationUpdate", method=RequestMethod.POST)
	public int evaluationUpdate(Evaluation evaluation){

		return 0;
	}
	//평가 정보 삭제
	@RequestMapping(value="evaluationDelete", method=RequestMethod.GET)
	public int evaluationDelete(String email){

		return 0;
	}
}

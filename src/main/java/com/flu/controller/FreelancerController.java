package com.flu.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.freelancer.FreelancerDTO;
import com.flu.freelancer.FreelancerServiceImpl;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.Skill;

@Controller
@RequestMapping(value="/member/**")
public class FreelancerController {

	@Inject
	private FreelancerServiceImpl freelancerService;

	

	//프리랜서 리스트
	@RequestMapping(value="freeList", method=RequestMethod.GET)
	public List<FreelancerDTO> freelancerList(){
		return null;
	}




	/////////////////////////////////////////////////////////////////////////////////////////////

	//프리랜서 정보 입력(추가로 입력 Update)
	@RequestMapping(value="freeInsert2", method=RequestMethod.POST)
	public int freelancerInsert2(FreelancerDTO freelancerDTO){

		return 0;
	}
	
	/************************** Intro **********************************/
	//자기소개 등록 폼
	@RequestMapping(value="introInsert", method=RequestMethod.GET)
	public void introInsert(){
		
	}
	//자기소개 등록
	@RequestMapping(value="introInsert", method=RequestMethod.POST)
	public void introInsert(FreelancerDTO freelancerDTO){
		
	}
	//자기소개 뷰
	@RequestMapping(value="introView")
	public String introView(HttpSession session){
		return "/member/freelancer/intro";
	}
	//자기소개 수정
	@RequestMapping(value="introUpdate")
	public void introUpdate(HttpSession session){
		
	}
	
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	@RequestMapping(value="portfolioInsert", method=RequestMethod.POST)
	public void portfolioInsert(PortFolio portFolio){

	}

	//포트폴리오 뷰
	@RequestMapping(value="portfolioView", method=RequestMethod.GET)
	public String portfolioView(String email){
		return "/member/freelancer/portfolio";
	}
	//포트폴리오 리스트
	@RequestMapping(value="portfolioList", method=RequestMethod.GET)
	public void portfolioList(){

	}
	//포트폴리오 수정
	@RequestMapping(value="portfolioUpdate", method=RequestMethod.POST)
	public void portfolioUpdate(PortFolio portFolio){

	}
	//포트폴리오 삭제
	@RequestMapping(value="portfolioDelete", method=RequestMethod.POST)
	public void portfolioDelete(String email){

	}
	/************************** Skill *******************************/
	//보유기술 등록
	@RequestMapping(value="skillInsert", method=RequestMethod.POST)
	public void skillInsert(Skill skill){

	}

	//보유기술 뷰
	@RequestMapping(value="skillView", method=RequestMethod.POST)
	public String skillView(String email){
		return "/member/freelancer/skill";
	}
	//보유기술 리스트
	@RequestMapping(value="skillList", method=RequestMethod.GET)
	public void skillList(){

	}
	//보유기술 수정
	@RequestMapping(value="skillUpdate", method=RequestMethod.POST)
	public void skillUpdate(Skill skill){

	}
	//보유기술 삭제
	@RequestMapping(value="skillDelete", method=RequestMethod.GET)
	public void skillDelete(String email){

	}
	/************************** Carrer *******************************/
	//경력, 학력, 자격증
	@RequestMapping(value="carrer", method=RequestMethod.GET)
	public String carrer(String email){
		return "/member/freelancer/carrer";
	}
	//경력 등록
	@RequestMapping(value="carrerInsert", method=RequestMethod.POST)
	public void carrerInsert(Carrer carrer){

	}

	//경력 뷰
	@RequestMapping(value="carrerView", method=RequestMethod.GET)
	public void carrerView(String email){
		
	}
	//경력 수정
	@RequestMapping(value="carrerUpdate", method=RequestMethod.POST)
	public void carrerUpdate(Carrer carrer){

	}
	//경력 삭제
	@RequestMapping(value="carrerDelete", method=RequestMethod.GET)
	public void carrerDelete(String email){

	}
	/************************** Academic *******************************/
	//학력 등록
	@RequestMapping(value="academicInsert", method=RequestMethod.POST)
	public void academicInsert(Academic academic){

	}

	//학력 뷰
	@RequestMapping(value="academicView", method=RequestMethod.GET)
	public void academicView(String email){

	}
	//학력 수정
	@RequestMapping(value="academicUpdate", method=RequestMethod.POST)
	public void academicUpdate(Academic academic){

	}
	//학력 삭제
	@RequestMapping(value="academicDelete", method=RequestMethod.GET)
	public void academicDelete(String email){

	}
	/************************** License *******************************/
	//자격증 증록
	@RequestMapping(value="licenseInsert", method=RequestMethod.POST)
	public void licenseInsert(License license){

	}

	//자격증 뷰
	@RequestMapping(value="licenseView", method=RequestMethod.POST)
	public void licenseView(String email){

	}
	//자격증 수정
	@RequestMapping(value="licenseUpdate", method=RequestMethod.GET)
	public void licenseUpdate(License license){

	}
	//자격증 삭제
	@RequestMapping(value="licenseDelete", method=RequestMethod.GET)
	public void licenseDelete(String email){

	}
	/************************** Evaluation *******************************/
	//평가 정보 등록
	@RequestMapping(value="evaluationInsert", method=RequestMethod.POST)
	public void evaluationInsert(Evaluation evaluation){

	}

	//평가 정보 뷰
	@RequestMapping(value="evaluationView", method=RequestMethod.GET)
	public String evaluationView(String email){
		return "/member/freelancer/evaluation";
	}
	//평가 정보 수정
	@RequestMapping(value="evaluationUpdate", method=RequestMethod.POST)
	public void evaluationUpdate(Evaluation evaluation){

	}
	//평가 정보 삭제
	@RequestMapping(value="evaluationDelete", method=RequestMethod.GET)
	public void evaluationDelete(String email){

	}
	/************************* myproject *******************************/
	
	//내가 FLU 에서 진행한 프로젝트
	@RequestMapping(value="myproject")
	public String myproject(){
		return "/member/freelancer/myproject";
	}
	
}

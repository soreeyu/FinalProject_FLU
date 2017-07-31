package com.flu.freelancer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.member.MemberDTO;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.PortFolioImg;
import com.flu.profile.Skill;
import com.flu.profile.TypeInfo;
import com.flu.util.ListInfo;

@Service
public class FreelancerService{

	
	
	@Inject
	private FreelancerDAO freelancerDAO;

	
	
	//프리랜서 등록
	public int freelancerInsert(FreelancerDTO freelancerDTO){
		return 0;
	}
	
	//totalCount
	public int totalcount(ListInfo listInfo){
		return freelancerDAO.totalcount(listInfo);
	}

	//프리랜서 리스트
	public Map<String, Object> freelancerList(ListInfo listInfo){
		return freelancerDAO.freelancerList(listInfo);
	}

	//프리랜서 뷰
	public FreelancerDTO freelancerView(String email){
		
		return freelancerDAO.freelancerView(email);
	}
	
	
	//관심분야를 가져서와서 리스트에 담는 뷰
	public Map<String, Object> freelancerView2(String email){
		System.out.println("내 이메일 :"+email);
		FreelancerDTO freelancerDTO = freelancerDAO.freelancerView(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<String> ar = new ArrayList<String>();
		List<String> ar2 = new ArrayList<String>();
		if(freelancerDTO.getInteresting() != null){
		String interesting = freelancerDTO.getInteresting();
		String [] interestingArray = interesting.split(",");
		
		String [] interestingArray2 = null;
		
		for(int i = 0; i< interestingArray.length; i++){
			interestingArray2 = interestingArray[i].split("_");
			
			System.out.println("리스트1 : "+ interestingArray2[1]);
			if(interestingArray2[0].equals("개발")){
				ar.add(interestingArray2[1]);
			}else{
				ar2.add(interestingArray2[1]);

			}
			
		}
		map.put("interesting", ar);
		map.put("interesting2", ar2);
		map.put("dto", freelancerDAO.freelancerView(email));
		}else{
			map.put("dto", freelancerDAO.freelancerView(email));
			map.put("interesting", ar);
			map.put("interesting2", ar2);
		}
		
		return map;
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
	
	//프리랜서 정보 등록
	public int infoInsert(FreelancerDTO freelancerDTO){
		return freelancerDAO.infoInsert(freelancerDTO);
	}
	
	//프리랜서 정보 수정
	public int infoUpdate(FreelancerDTO freelancerDTO){
		return freelancerDAO.infoUpdate(freelancerDTO);
	}
	
	
	/************************** Intro *******************************/
	//자기소개 등록
	public int introInsert(FreelancerDTO freelancerDTO){
		return freelancerDAO.introInsert(freelancerDTO);
	}
	//자기소개 수정
	public int introUpdate(FreelancerDTO freelancerDTO){
		return freelancerDAO.introUpdate(freelancerDTO);
	}
	
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	public int portfolioInsert(PortFolio portFolio, List<PortFolioImg> ar){

		
		return freelancerDAO.portfolioInsert(portFolio, ar);
	}

	//포트폴리오 뷰
	public Map<String, Object> portfolioView(int pfNum){

		return freelancerDAO.portfolioView(pfNum);
	}
	//포트폴리오 리스트
	public List<PortFolio> portfolioList(String email){

		return freelancerDAO.portfolioList(email);
	}
	//포트폴리오 수정
	public int portfolioUpdate(PortFolio portFolio, List<PortFolioImg> ar){

		return freelancerDAO.portfolioUpdate(portFolio, ar);
	}
	//포트폴리오 삭제
	public int portfolioDelete(String email){

		return 0;
	}
	/************************** Skill *******************************/
	//보유기술 등록
	public int skillInsert(List<Skill> ar){
		freelancerDAO.skillInsert(ar);
		return 0;
	}

	//보유기술 뷰
	public Skill skillView(String email){

		return null;
	}

	//보유기술 리스트
	public List<Skill> skillList(String email){
		
		List<Skill> ar = freelancerDAO.skillList(email);
		
		if(ar.size() > 0){
			for(int i = 0; i< ar.size(); i++){
				if(ar.get(i).getSlevel().equals("1")){
					ar.get(i).setSlevel("초급");
				}else if(ar.get(i).getSlevel().equals("2")){
					ar.get(i).setSlevel("중급");
				}else if(ar.get(i).getSlevel().equals("3")){
					ar.get(i).setSlevel("고급");
				}else{
					ar.get(i).setSlevel("특급");
				}
				if(ar.get(i).getExp().equals("1")){
					ar.get(i).setExp("1년미만");
				}else if(ar.get(i).getExp().equals("2")){
					ar.get(i).setExp("1년이상 3년미만");
				}else if(ar.get(i).getExp().equals("3")){
					ar.get(i).setExp("3년이상 5년미만");
				}else if(ar.get(i).getExp().equals("4")){
					ar.get(i).setExp("5년이상 10년미만");
				}else{
					ar.get(i).setExp("10년이상");
				}
				
			}
		}
		
		return ar;
	}
	//기술 리스트 파싱 작업
	public Map<String, Object> myskillList(String email){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<String> slevel = new ArrayList<String>();
		List<String> exp = new ArrayList<String>();
		
		List<Skill> ar = freelancerDAO.skillList(email);
		
		for(int i = 0; i < ar.size(); i++){
			
			String lv = ar.get(i).getSlevel();
			slevel.add(lv);
			lv = ar.get(i).getExp();
			exp.add(lv);
		}
		map.put("slevel", slevel);
		map.put("exp", exp);
		
		return map;
	}

	//보유기술 수정
	public int skillUpdate(List<Skill> ar){
		int result = freelancerDAO.skillDelete(ar.get(0).getEmail());
		
		if(result > 0){
		result = freelancerDAO.skillInsert(ar);
		}
		return result;
	}
	//보유기술 삭제
	public int skillDelete(String email){
		
		return freelancerDAO.skillDelete(email);
	}
	/************************** Carrer *******************************/
	//경력 등록
	public int carrerInsert(Carrer carrer){
		
		return freelancerDAO.carrerInsert(carrer);
	}

	//경력 뷰
	public Carrer carrerView(Carrer carrer){

		return freelancerDAO.carrerView(carrer);
	}
	//경력 리스트
	public List<Carrer> carrerList(String email){

		return freelancerDAO.carrerList(email);
	}
	//경력 수정
	public int carrerUpdate(Carrer carrer){
		
		
		return freelancerDAO.carrerUpdate(carrer);
	}
	//경력 삭제
	public int carrerDelete(Carrer carrer){

		return freelancerDAO.carrerDelete(carrer);
	}
	/************************** Academic *******************************/
	//학력 등록
	public int academicInsert(Academic academic){

		return freelancerDAO.academicInsert(academic);
	}

	//학력 뷰
	public Academic academicView(Academic academic){

		return freelancerDAO.academicView(academic);
	}
	//학력 리스트
	public List<Academic> academicList(String email){

		return freelancerDAO.academicList(email);
	}
	//학력 수정
	public int academicUpdate(Academic academic){
		
		
		return freelancerDAO.academicUpdate(academic);
	}
	//학력 삭제
	public int academicDelete(Academic academic){

		return freelancerDAO.academicDelete(academic);
	}
	/************************** License *******************************/
	//자격증 증록
	public int licenseInsert(License license){

		return freelancerDAO.licenseInsert(license);
	}

	//자격증 뷰
	public License licenseView(License license){

		return freelancerDAO.licenseView(license);
	}
	//자격증 리스트
	public List<License> licenseList(String email){

		return freelancerDAO.licenseList(email);
	}
	//자격증 수정
	public int licenseUpdate(License license){
		return freelancerDAO.licenseUpdate(license);
	}
	//자격증 삭제
	public int licenseDelete(License license){

		return freelancerDAO.licenseDelete(license);
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
	
	//나에대한 평가 정보 리스트의 평균
	public Map<String, Object> evaluationList(String email){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Evaluation> ar = freelancerDAO.evaluationList(email);
		
		int professional = 0;
		int satisfy = 0;
		int communication = 0;
		int schedule = 0;
		int passion = 0;
		
		if(ar.size() > 0){
			for(int i = 0; i< ar.size(); i++){
				professional = professional + ar.get(i).getProfessional();
				satisfy = satisfy + ar.get(i).getSatisfy();
				communication = communication + ar.get(i).getCommunication();
				schedule = schedule + ar.get(i).getSchedule();
				passion = passion + ar.get(i).getPassion();
				
			}
			professional = professional/ar.size();
			satisfy = satisfy/ar.size();
			communication = communication/ar.size();
			schedule = schedule/ar.size();
			passion = passion/ar.size();
			
		}
		map.put("professional", professional);
		map.put("satisfy", satisfy);
		map.put("communication", communication);
		map.put("schedule", schedule);
		map.put("passion", passion);
		map.put("totalavr", (professional+satisfy+communication+schedule+passion)/5);
		map.put("projectList", ar.size());
		
		
		return map;
	}
	
	
	
	//평가 정보 수정
	public int evaluationUpdate(Evaluation evaluation){

		return 0;
	}
	//평가 정보 삭제
	public int evaluationDelete(String email){

		return 0;
	}

	/****************************** 내 프로젝트 *********************************/
	public Map<String, Object> myprojectList(String email){
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> ar = freelancerDAO.myprojectList2(email);
		int count1 = 0;
		int count2 = 0;
		if(ar.size() >= 1){
			for(int i = 0; i < ar.size(); i++){
				System.out.println(ar.get(i));
				if(ar.get(i).equals("개발")){
					count1++;
				}else{
					count2++;
				}
			}
		
		}
		map.put("category1", count1);
		map.put("category2", count2);
		map.put("projectList", ar.size());
		
		return map;
	}
	


}

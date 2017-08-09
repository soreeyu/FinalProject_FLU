package com.flu.freelancer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.applicant.ApplicantDTO;
import com.flu.member.MemberDTO;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.PortFolioImg;
import com.flu.profile.Skill;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Repository
public class FreelancerDAO{

	
	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "FreelancerMapper.";
	
	
	//프리랜서 계정 정보 뷰
	public MemberDTO freelancerMemberView(String email){
		return sqlSession.selectOne(NAMESPACE+"memberView", email);
	}
	
	//프리랜서 1명 가져오기
	public FreelancerDTO freelancerView(String email){
		return sqlSession.selectOne(NAMESPACE+"freelancerView", email);
	}
	
	//totalCount
	public int totalcount(ListInfo listInfo){
		System.out.println("데이터 갯수 : "+sqlSession.selectOne(NAMESPACE+"freelancerCount", listInfo));
		return sqlSession.selectOne(NAMESPACE+"freelancerCount", listInfo);
	}
	
	//프리랜서 리스트1 email
	private List<String> getemail(ListInfo listInfo){
		
		return sqlSession.selectList(NAMESPACE+"freelancerList_email", listInfo);
	}
	//프리랜서 리스트2 각각의 리스트
	public Map<String, Object> freelancerList(ListInfo listInfo){
		
		System.out.println(listInfo.getSearch());
		List<String> ar = this.getemail(listInfo);
		List<MemberDTO> ar1 = new ArrayList<MemberDTO>();
		List<FreelancerDTO> ar2 = new ArrayList<FreelancerDTO>();
		List<List<Skill>> ar4 = new ArrayList<List<Skill>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> prosize = new ArrayList<Integer>();
		List<Integer> pofolsize = new ArrayList<Integer>();
		if(ar.size() > 0){
		for(int i =0; i < ar.size(); i++){
			System.out.println(ar.get(i));
			ar1.add((MemberDTO)sqlSession.selectOne(NAMESPACE+"freelancerList_member", ar.get(i)));
			ar2.add((FreelancerDTO)sqlSession.selectOne(NAMESPACE+"freelancerList_freelancer", ar.get(i)));
			
			
			List<Skill> ars = sqlSession.selectList(NAMESPACE+"skillList", ar.get(i));
			ar4.add(ars);
			prosize.add(this.myprojectList(ar.get(i)).size());
			pofolsize.add(this.portfolioList(ar.get(i)).size());
		}
		}
		map.put("member", ar1); 
		map.put("freelancer", ar2);
		map.put("skills", ar4);
		map.put("myproject", prosize);
		map.put("portfolio", pofolsize);
		
		return map;
	}
	
	public Map<String, Object> freelancerListEval(ListInfo listInfo){
		List<String> ar =this.getemail(listInfo);
		List<Integer> ar2 = new ArrayList<Integer>();
		List<Integer> ar3 = new ArrayList<Integer>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(ar.size() > 0){
			System.out.println("배열길이: "+ar.size());
			for(int i =0; i< ar.size(); i++){
				System.out.println("이름들 :"+ar.get(i));
				List<Evaluation> eval2 = sqlSession.selectList(NAMESPACE+"evaluationList",ar.get(i)); 
				if(eval2.size() > 0){
					System.out.println(ar.get(i)+"의 평가 갯수 : "+eval2.size());
					int total = 0;
					for(int j =0; j < eval2.size(); j++){
						total = total + (eval2.get(j).getProfessional()+eval2.get(j).getSatisfy()+eval2.get(j).getCommunication()+eval2.get(j).getPassion()+eval2.get(j).getSchedule())/5;
						
					}
					total = total/eval2.size();
					ar2.add(total);
					ar3.add(eval2.size());
				}else{
					ar2.add(0);
					ar3.add(0);
				}
			}
		}
		map.put("eval", ar2);
		map.put("evaluationLength", ar3);
		return map;
	}
	
	
	//프리랜서 정보 입력(추가로 입력 Update)
	public int freelancerInsert(FreelancerDTO freelancerDTO){
		
		return 0;
	}
	
	//프리랜서 정보 입력
	public int infoInsert(FreelancerDTO freelancerDTO){
		int result = 0;
		if(this.freelancerView(freelancerDTO.getEmail()) != null){
			result = sqlSession.update(NAMESPACE+"infoUpdate", freelancerDTO);
			System.out.println("수정 : 값있음");
		}else{
			result = sqlSession.insert(NAMESPACE+"infoInsert", freelancerDTO);
			System.out.println("생성 : 값없음");
		}
		return result;
	}
	
	//프리랜서 정보 수정
	public int infoUpdate(FreelancerDTO freelancerDTO){
		
		return sqlSession.update(NAMESPACE+"infoUpdate", freelancerDTO);
	}
	
	/************************** Intro *******************************/
	public int introInsert(FreelancerDTO freelancerDTO){
		//프리랜서 정보가 있으면 새로 인서트
		int result = 0;
		if(sqlSession.selectOne(NAMESPACE+"freelancerView", freelancerDTO) != null){
			result =sqlSession.update(NAMESPACE+"introUpdate", freelancerDTO);
			System.out.println("값 있음 : 수정");
		}else{
			result = sqlSession.insert(NAMESPACE+"introInsert", freelancerDTO);
			System.out.println("값 없음 : 생성");
		}
		
		return result;
	}
	//자기소개 수정
	public int introUpdate(FreelancerDTO freelancerDTO){
		
		return sqlSession.update(NAMESPACE+"introUpdate", freelancerDTO);
		 
	}
	
	/************************** PortFolio *******************************/
	//포트폴리오 등록
	public int portfolioInsert(PortFolio portFolio, List<PortFolioImg> ar){
		
		int result =sqlSession.insert(NAMESPACE+"portfolioInsert", portFolio);
		if(result >0){
			int seq = sqlSession.selectOne(NAMESPACE+"portfolioseq", portFolio.getEmail());
			for(int i = 0; i < ar.size(); i++){
				ar.get(i).setPfNum(seq);
			result =sqlSession.insert(NAMESPACE+"pf_imageInsert", ar.get(i));
			}
		}else{
			
		}
		
		
		return result;
	}
	
	//포트폴리오 뷰
	public Map<String, Object> portfolioView(int pfNum){
		
		Map<String , Object> map = new HashMap<String, Object>();
		
		map.put("dto", sqlSession.selectOne(NAMESPACE+"portfolioView", pfNum));
		map.put("imglist", sqlSession.selectList(NAMESPACE+"pf_imageView", pfNum));
		
		return map;
	}
	
	//포트폴리오 리스트
	public List<PortFolio> portfolioList(String email){
		
		return sqlSession.selectList(NAMESPACE+"portfolioList", email);
	}
	
	//포트폴리오 수정
	public int portfolioUpdate(PortFolio portFolio, List<PortFolioImg> ar){
		
	
		int result =sqlSession.update(NAMESPACE+"portfolioUpdate", portFolio);
		
		
		if(result >0){
			sqlSession.delete(NAMESPACE+"pf_imageDelete", portFolio.getPfNum());
			for(int i = 0; i < ar.size(); i++){
				ar.get(i).setPfNum(portFolio.getPfNum());
				
			result =sqlSession.insert(NAMESPACE+"pf_imageInsert", ar.get(i));
			}
		}else{
		}
		return result;
		
	}
	
	//포트폴리오 삭제
	public int portfolioDelete(String email){
			
		return 0;
	}
	/************************** Skill *******************************/
	//보유기술 등록
	public int skillInsert(List<Skill> ar){
		
		for(int i = 0; i< ar.size(); i++){
		sqlSession.insert(NAMESPACE+"skillInsert", ar.get(i));
		}
		return 0;
	}
	
	//보유기술 뷰
	public Skill skillView(Skill skill){
		sqlSession.selectOne(NAMESPACE+"skillView", skill);
		return null;
	}
	
	//보유기술 리스트
	public List<Skill> skillList(String email){
		
		return sqlSession.selectList(NAMESPACE+"skillList", email);
	}
	//보유기술 수정
	public int skillUpdate(Skill skill){
			
		return 0;
	}
	//보유기술 삭제
	public int skillDelete(String email){
		
		return sqlSession.delete(NAMESPACE+"skillDelete", email);
	}
	/************************** Carrer *******************************/
	//경력 등록
	public int carrerInsert(Carrer carrer){
		
		
		
		return sqlSession.insert(NAMESPACE+"carrerInsert", carrer);
	}
	
	//경력 뷰
	public Carrer carrerView(Carrer carrer){
		
		
		
		return sqlSession.selectOne(NAMESPACE+"carrerView", carrer);
	}
	//경력 리스트
	public List<Carrer> carrerList(String email){
		
		
		
		return sqlSession.selectList(NAMESPACE+"carrerList", email);
	}
	//경력 수정
	public int carrerUpdate(Carrer carrer){
		
		return sqlSession.update(NAMESPACE+"carrerUpdate", carrer);
	}
	
	//경력 삭제
	public int carrerDelete(Carrer carrer){
			
		
		
		return sqlSession.delete(NAMESPACE+"carrerDelete", carrer);
	}
	/************************** Academic *******************************/
	//학력 등록
	public int academicInsert(Academic academic){
		
		
		return sqlSession.insert(NAMESPACE+"academicInsert", academic);
	}
	
	//학력 뷰
	public Academic academicView(Academic academic){
		
		return sqlSession.selectOne(NAMESPACE+"academicView", academic);
	}
	
	//학력 리스트
	public List<Academic> academicList(String email){

		return sqlSession.selectList(NAMESPACE+"academicList", email);
	}
	//학력 수정
	public int academicUpdate(Academic academic){
			
		return sqlSession.update(NAMESPACE+"academicUpdate", academic);
	}
	//학력 삭제
	public int academicDelete(Academic academic){
			
		return sqlSession.delete(NAMESPACE+"academicDelete", academic);
	}
	/************************** License *******************************/
	//자격증 증록
	public int licenseInsert(License license){
		
		return sqlSession.insert(NAMESPACE+"licenseInsert", license);
	}
	
	//자격증 뷰
	public License licenseView(License license){
		
		return sqlSession.selectOne(NAMESPACE+"licenseView", license);
	}
	//자격증 뷰
	public List<License> licenseList(String email){
		
		return sqlSession.selectList(NAMESPACE+"licenseList", email);
	}
	//자격증 수정
	public int licenseUpdate(License license){
			
		return sqlSession.update(NAMESPACE+"licenseUpdate", license);
	}
	//자격증 삭제
	public int licenseDelete(License license){
			
		return sqlSession.delete(NAMESPACE+"licenseDelete", license);
	}
	/************************** Evaluation *******************************/
	//평가 정보 등록
	public int evaluationInsert(Evaluation evaluation){
		
		return 0;
	}
	
	//프리랜서에 대한 평가 정보 뷰
	public Evaluation evaluationView1(String email){
		
		return null;
	}
	
	//나에대한 평가 정보 리스트
	public List<Evaluation> evaluationList(String email){
		
		return sqlSession.selectList(NAMESPACE+"evaluationList", email);
	}
	
	//평가 정보 수정
	public int evaluationUpdate(Evaluation evaluation){
		
		return 0;
	}
	//평가 정보 삭제
	public int evaluationDelete(String email){
		
		return 0;
	}
	
	//프로젝트 이름,넘버 가져오기
	public Map<String, Object> getProjectName(String email){
		List<Evaluation> ar = this.evaluationList(email);
		List<List<ProjectDTO>> ar2 = new ArrayList<List<ProjectDTO>>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(ar.size() > 0){
			for(int i = 0; i< ar.size(); i++){
				List<ProjectDTO> arr = sqlSession.selectList(NAMESPACE+"getProjectName", ar.get(i));
				ar2.add(arr);
			}
			
		}
		map.put("projectName", ar2);
		
		return map;
	}
	
	/************************* myProject ********************************/
	
	//내 프로젝트 리스트
	public List<String> myprojectList(String email){
		
		
		return sqlSession.selectList(NAMESPACE+"myproject", email);
	}
	
	//프로젝트 개발/디자인 구분리스트
	public List<String> myprojectList2(String email){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNum",this.myprojectList(email));
		map.put("length", this.myprojectList(email).size());
		System.out.println("랭스 길이 : "+this.myprojectList(email).size());
		
		return sqlSession.selectList(NAMESPACE+"myprojectList", map);
	}
	
	
	/************************** myproject *******************************/
	
	
	
	//freelancer 나의 프로젝트리스트
	public List<ProjectDTO> listAll(MemberDTO memberDTO, ListInfo listInfo, ApplicantDTO applicantDTO){
		
		System.out.println("freelancer dao - memberEmail="+memberDTO.getEmail());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("member", memberDTO);
		map.put("applicant", applicantDTO);
		
		return sqlSession.selectList(NAMESPACE+"project_list", map);
	}
	
	public int countAll(MemberDTO memberDTO, ListInfo listInfo, ApplicantDTO applicantDTO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("member", memberDTO);
		map.put("applicant", applicantDTO);
		
		return sqlSession.selectOne(NAMESPACE+"project_count", map);
	}
	

	/************************** Authentic *******************************/

}

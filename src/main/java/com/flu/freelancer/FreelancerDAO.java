package com.flu.freelancer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.PortFolio;
import com.flu.profile.PortFolioImg;
import com.flu.profile.Skill;

@Repository
public class FreelancerDAO{

	
	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "FreelancerMapper.";
	
	//프리랜서 1명 가져오기
	public FreelancerDTO freelancerView(String email){
		return sqlSession.selectOne(NAMESPACE+"freelancerView", email);
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

}

package com.flu.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.applicant.ApplicantDTO;
import com.flu.member.MemberDTO;
import com.flu.project.sell.PjSellDTO;
import com.flu.util.ListInfo;

@Repository
public class ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ProjectMapper.";
	
	
		//project insert
		public int projectInsert(ProjectDTO projectDTO){
			return sqlSession.insert(NAMESPACE+"insert", projectDTO);
		}
		
		//project update
		public int projectUpdate(ProjectDTO projectDTO){
			return sqlSession.update(NAMESPACE+"update", projectDTO);
		}
		
		//project delete
		public int projectDelete(int num){
			return sqlSession.delete(NAMESPACE+"delete", num);
		}
		
		//project View
		public ProjectDTO projectView(int num){
			return sqlSession.selectOne(NAMESPACE+"view", num);
		}
		
		//project List
		public List<ProjectDTO> projectList(ListInfo listInfo, ProjectDTO projectDTO,List<String> array){

			System.out.println("projectDAO-projectList들어옴");
			System.out.println("dao-list- arrange=="+listInfo.getArrange());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("project", projectDTO);
			map.put("arrange", listInfo.getArrange());
			map.put("array", array);
			if(array.size() == 0){
				map.put("result", 0);
				System.out.println("zz"+array.size());
			}else{
				map.put("result", 1);
				System.out.println("zz"+array.size());
			}
			System.out.println("dao-list-search==="+listInfo.getSearch());
			if(listInfo.getSearch() == null){
				map.put("sech", 0);
				System.out.println("sech==="+listInfo.getSearch());
			}else{
				map.put("sech", 1);
				System.out.println("sech==="+listInfo.getSearch());
			}
			
			return sqlSession.selectList(NAMESPACE+"list", map);
		}
		
		//project Count
		public int projectCount(ListInfo listInfo, ProjectDTO projectDTO, List<String> array){
			System.out.println("dao-projectCount");
			System.out.println("dao-count- arrange=="+listInfo.getArrange());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("project", projectDTO);
			map.put("arrange", listInfo.getArrange());
			map.put("array", array);
			if(array.size() == 0){
				map.put("result", 0);
				System.out.println("zz"+array.size());
			}else{
				map.put("result", 1);
				System.out.println("zz"+array.size());
			}
			System.out.println("dao-count-search==="+listInfo.getSearch());
			System.out.println("dao-projectCount="+sqlSession.selectOne(NAMESPACE+"count", map));
			return sqlSession.selectOne(NAMESPACE+"count", map);
		}
		
		//Client가 mypage에서 확인하는 myprojectList
		public List<ProjectDTO> clientPjList(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
			
			System.out.println("clientPjList들어옴");;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("member", memberDTO);
			map.put("project", projectDTO);
			
			System.out.println(map.get("project"));
			return sqlSession.selectList(NAMESPACE+"clientpjlist", map); 
		}
		//Client ProjectList의 Count
		public int clientPjCount(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
			System.out.println("dao들어옴");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("member", memberDTO);
			map.put("project", projectDTO);
			System.out.println(memberDTO.getEmail());
			return sqlSession.selectOne(NAMESPACE+"clientcount", map);
			
			
		}
		
		//지원자 목록
		public List<ApplicantDTO> applicantList(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
			System.out.println("어플리켄트리스트 들어옴");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("member", memberDTO);
			map.put("project", projectDTO);
			
			List<ProjectDTO> ar2 = sqlSession.selectList(NAMESPACE+"clientpjlist", map);
			for(int i =0; i< ar2.size(); i++){
				System.out.println("프로젝트 넘이 뭐야 :"+ar2.get(i).getProjectNum());
			}
			map.put("projectNumList", ar2);
			List<ApplicantDTO> ar = sqlSession.selectList(NAMESPACE+"applicantList", map);
			for(int i =0; i< ar.size(); i++){
			System.out.println("프로젝트 넘: "+ar.get(i).getProjectNum());
			System.out.println("지원자 이메일 : "+ar.get(i).getEmail());
			}
			return ar;
		}
		
		//지원자 프로젝트의 이메일 리스트
		public List<String> applicantEmailList(Integer projectNum){
			
			return sqlSession.selectList(NAMESPACE+"applicantEmailList", projectNum);
		}
		//선택한 지원자 업데이트
		public int applicantUpdateMeet(Map<String, Object> map){
			
			return sqlSession.update(NAMESPACE+"applicantUpdateMeet", map);
		}
		//지원자 업데이트후 프로젝트 상태 업데이트
		public int projectUpdateRecruit(Integer projectNum){
			
			return sqlSession.update(NAMESPACE+"projectUpdateRecruit", projectNum);
		}
		
		
		
		//지원자 업데이트
		public int applicantUpdateIng(Map<String, Object> map){
			List<String> ar = (List<String>)map.get("pay");
			List<String> ar2 = (List<String>)map.get("emailList");
			for(int i = 0; i < ar.size(); i++){
				System.out.println("DAO에서 페이 :"+ar.get(i));
				map.put("pay", ar.get(i));
				map.put("email", ar2.get(i));
				sqlSession.update(NAMESPACE+"applicantUpdateIng", map);
			}
			
			return 0;
		}
		//계약완료후 프로젝트 업데이트
		public int projectUpdateIng(ProjectDTO projectDTO){
			return sqlSession.update(NAMESPACE+"projectUpdateIng",projectDTO);
		}
		
		public List<String> meetList(Integer projectNum){
			return sqlSession.selectList(NAMESPACE+"meetList", projectNum);
		}
		
		
		public int sellingCount(ProjectDTO projectDTO){
			System.out.println("sellingCount dao 들어옴");
			
			return sqlSession.selectOne(NAMESPACE+"sellingCount", projectDTO);
		}
		
		public int ingCount(ProjectDTO projectDTO){
			System.out.println("ingCount dao 들어옴");
			
			return sqlSession.selectOne(NAMESPACE+"ingcount", projectDTO);
		}
		
		public int finishCount(ProjectDTO projectDTO){
			System.out.println("finishCount dao 들어옴");
			
			return sqlSession.selectOne(NAMESPACE+"finishcount", projectDTO);
		}
		
		public int pjCount(ProjectDTO projectDTO){
			System.out.println("pjCount dao 들어옴");
			
			return sqlSession.selectOne(NAMESPACE+"pjcount", projectDTO);
		}
		
		

		public int sellCount(ProjectDTO projectDTO){
			System.out.println("sellCount dao 들어옴");
			
			return sqlSession.selectOne(NAMESPACE+"sellCount", projectDTO);
		}
		
		public List<ProjectDTO> sellList(ProjectDTO projectDTO, ListInfo listInfo){
			System.out.println("sellList dao 들어옴");
			System.out.println(projectDTO.getCategory());
			System.out.println("state=="+projectDTO.getState());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("project", projectDTO);
			
			return sqlSession.selectList(NAMESPACE+"sellList", map);
		}
		
		//View에서 해당프로젝트에서 뿌려주는 프로젝트등록자 img
		public MemberDTO projectClient(ProjectDTO projectDTO){
			return sqlSession.selectOne(NAMESPACE+"projectClient", projectDTO);
		}
		
		//프로젝트 리스트에서 뿌려주는 done상태의 프로젝트 갯수
		public int projectListcount(ProjectDTO projectDTO){
			return sqlSession.selectOne(NAMESPACE+"projectcount", projectDTO);
		}
	
		//프로젝트 리스트에서 뿌려주는 급구리스트
		public List<ProjectDTO> quickList(ProjectDTO projectDTO, ListInfo listInfo){
			return sqlSession.selectList(NAMESPACE+"quickList", listInfo);
		}
		
		//프로젝트 리스트에서 뿌려주는 급구리스트 카운트
		public int quickCount(ProjectDTO projectDTO){
			System.out.println("quickCount-dao");
			return sqlSession.selectOne(NAMESPACE+"quickCount", projectDTO);
		}
		
		//pjsell update가 아닌 pjsell에 등록했을 때, project상태바꾸기
		public int updateProjectState(PjSellDTO pjSellDTO){
			return sqlSession.update(NAMESPACE+"updateProjectState", pjSellDTO);
		}
		
		//pjsell update가 아닌 pjsell에서 취소했을 때, project상태 finish로 바꾸기
		public int cancleProjectState(PjSellDTO pjSellDTO){
			return sqlSession.update(NAMESPACE+"cancleProjectState", pjSellDTO);
		}
		

		//index에 뿌려질 등록된 프로젝트 금액
		public int totalBudget() throws Exception{
			return sqlSession.selectOne(NAMESPACE+"totalBudget");
		}
		//index에 뿌려질 등록된 프로젝트 (금액 높은순으로 6개)
		public List<ProjectDTO> indexProjectList() throws Exception{
			return sqlSession.selectList(NAMESPACE+"indexProjectList");
		}

}

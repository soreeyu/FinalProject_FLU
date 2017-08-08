package com.flu.project;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		
		//프로젝트 리스트에서 뿌려주는 recruit상태의 프로젝트 갯수
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
		
		
}

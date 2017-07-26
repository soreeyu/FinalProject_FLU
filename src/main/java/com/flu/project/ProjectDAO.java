package com.flu.project;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.member.MemberDTO;
import com.flu.reply.ReplyDTO;
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
		public List<ProjectDTO> projectList(ListInfo listInfo){
			return sqlSession.selectList(NAMESPACE+"list", listInfo);
		}
		
		//project Count
		public int projectCount(ListInfo listInfo){
			return sqlSession.selectOne(NAMESPACE+"count", listInfo);
		}
		
		//Client가 mypage에서 확인하는 myprojectList
		public List<ProjectDTO> clientPjList(HashMap<String, Object> map){
			List<ReplyDTO> ar = sqlSession.selectList(NAMESPACE+"clientpjlist", map);
			System.out.println("dao의 ar=="+ar);
			return sqlSession.selectList(NAMESPACE+"clientpjlist", map); 
		}
		//Client ProjectList의 Count
		public int clientPjCount(MemberDTO memberDTO){
			System.out.println("dao들어옴");
			/*HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("listInfo", listInfo);
			map.put("member", memberDTO);
			System.out.println(memberDTO.getEmail());
			return sqlSession.selectOne(NAMESPACE+"clientcount", map);*/
			return sqlSession.selectOne(NAMESPACE+"clientcount", memberDTO);
			
		}
		
		
}

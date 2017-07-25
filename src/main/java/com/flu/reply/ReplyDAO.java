package com.flu.reply;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Repository
public class ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ReplyMapper.";

	
	public int replyInsert(ReplyDTO replyDTO){
		return sqlSession.insert(NAMESPACE+"insert", replyDTO);
	}
	
	public int replyUpdate(ReplyDTO replyDTO){
		return sqlSession.update(NAMESPACE+"update", replyDTO);
	}
	
	public int replyDelete(int num){
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public List<ReplyDTO> replyList(HashMap<String, Object> map){
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);*/
		List<ReplyDTO> ar = sqlSession.selectList(NAMESPACE+"list", map);
		System.out.println("dao의 ar=="+ar);
		return sqlSession.selectList(NAMESPACE+"list", map); 
	}
	
	public int replyCount(ListInfo listInfo, ProjectDTO projectDTO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);
		return sqlSession.selectOne(NAMESPACE+"count", map);
	}
	
}

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
		System.out.println("reply-dao");
		System.out.println(replyDTO.getRef());
		return sqlSession.insert(NAMESPACE+"insert", replyDTO);
	}
	
	public int replyReInsert(ReplyDTO replyDTO){
		return sqlSession.insert(NAMESPACE+"replyinsert", replyDTO);
	}
	
	public int replyUpdate(ReplyDTO replyDTO){
		return sqlSession.update(NAMESPACE+"update", replyDTO);
	}
	
	public int replyDelete(int num){
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public List<ReplyDTO> replyList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"list", map); 
	}
	
	public int replyCount(ListInfo listInfo, ProjectDTO projectDTO){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);
		return sqlSession.selectOne(NAMESPACE+"count", map);
	}
	
	//답글누를때, 부모의 num을 자식의 ref에 셋팅하기위해 찾기
	public ReplyDTO checkReply(ReplyDTO replyDTO){
		int num = replyDTO.getNum();
		System.out.println("reply-dao에서 num="+num);
		return sqlSession.selectOne(NAMESPACE+"checkReply", replyDTO);
	}
	
	//답글누를때, 부모의 num을 자식의 ref에 셋팅하기
	public int insertRef(ReplyDTO replyDTO){
		return sqlSession.selectOne(NAMESPACE+"insertRef", replyDTO);
	}
}

package com.flu.reply;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Service
public class ReplyService {

	@Inject
	private ReplyDAO replyDAO;
	
	public int replyInsert(ReplyDTO replyDTO){
		return replyDAO.replyInsert(replyDTO) ;
	}
	
	public int replyUpdate(ReplyDTO replyDTO){
		return replyDAO.replyUpdate(replyDTO);
	}
	
	public int replyDelete(int num){
		return replyDAO.replyDelete(num);
	}
	
	public List<ReplyDTO> replyList(ListInfo listInfo, ProjectDTO projectDTO){
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);
		List<ReplyDTO> ar =  replyDAO.replyList(map);
		
		System.out.println("service의 ar=="+ar);
		
		return replyDAO.replyList(map); 
	}
	
	public int replyCount(ListInfo listInfo, ProjectDTO projectDTO){
		return replyDAO.replyCount(listInfo, projectDTO);
	}
	
}

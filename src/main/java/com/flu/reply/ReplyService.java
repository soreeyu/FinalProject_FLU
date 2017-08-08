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
		System.out.println("replydelete - service");
		return replyDAO.replyDelete(num);
	}
	
	public List<ReplyDTO> replyList(HashMap<String, Object> map){
		
		
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);*/
		List<ReplyDTO> ar =  replyDAO.replyList(map);
		
		System.out.println("service의 ar=="+ar);
		
		return replyDAO.replyList(map); 
	}
	
	public int replyCount(ListInfo listInfo, ProjectDTO projectDTO){
		return replyDAO.replyCount(listInfo, projectDTO);
	}
	
	//답글누를때, 부모의 num을 자식의 ref에 셋팅하기위해 찾기
		public ReplyDTO checkReply(ReplyDTO replyDTO){
			int num = replyDTO.getNum();
			System.out.println("reply-service에서 num="+num);
			return replyDAO.checkReply(replyDTO);
		}
		
	//답글누를때, 부모의 num을 자식의 ref에 셋팅하기
	public int insertRef(ReplyDTO replyDTO){
		return replyDAO.insertRef(replyDTO);
	}
	
}

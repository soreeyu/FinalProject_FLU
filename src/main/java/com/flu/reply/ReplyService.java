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
			System.out.println("checkReply-service");
			System.out.println("reply-service에서 num="+num);
			replyDTO = replyDAO.checkReply(replyDTO);
			
			System.out.println("reply-num="+replyDTO.getNum());
			System.out.println("reply-ref="+replyDTO.getRef());
			System.out.println("reply-step="+replyDTO.getStep());
			System.out.println("reply-depth="+replyDTO.getDepth());
			
			return replyDTO;
		}
		
	//답글 등록할 떄, update해주기
	public int updateReply(ReplyDTO replyDTO){
		System.out.println("reply-update-service");
		System.out.println(replyDTO.getRef());
		System.out.println(replyDTO.getStep());
		return replyDAO.updateReply(replyDTO);
	}
	
	//새 답글 등록하기
	public int insertReply(HashMap<String, Object> map){
		return replyDAO.insertReply(map);
	}
	
	
		
	//답글누를때, 부모의 num을 자식의 ref에 셋팅하기
	/*public int insertRef(ReplyDTO replyDTO){
		return replyDAO.insertRef(replyDTO);
	}*/
	
}

package com.flu.checkMember;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flu.member.MemberDAO;
import com.flu.member.MemberDTO;
import com.flu.util.ListInfo;

@Service
public class CheckMemberService {

	@Inject
	private CheckMemberDAO checkMemberDAO;

	@Transactional
	public int insertTran(CheckMemberDTO checkMemberDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(checkMemberDTO.getEmail());
		memberDTO.setAuthenticState("1");//1이 접수중
		int result1 = checkMemberDAO.checkUpdate(memberDTO); //Member에서 신원확인 업데이트
		System.out.println("업데이트 갔다가~");
		int result2 = checkMemberDAO.insert(checkMemberDTO); //checkMember에 접수중으로 삽입
		
		int result = 0;
		
		if(result1>0 && result2>0){
			result = 1;
		}
		System.out.println("최종result: "+result);
		return result;
	}
	
	
	public List<CheckMemberViewDTO> clientList(ListInfo listInfo){
		return checkMemberDAO.clientList(listInfo);
	}
	
	public List<CheckMemberViewDTO> freelancerList(ListInfo listInfo){
		return checkMemberDAO.freelancerList(listInfo);
	}
	

	public MemberDTO view(String email){
		return checkMemberDAO.view(email);
	}
	
	
	public CheckMemberViewDTO checkView(String email){
		return checkMemberDAO.checkView(email);
	}
	
	
	public int update(String email){
		MemberDTO memberDTO = new MemberDTO();

		memberDTO.setEmail(email);
		memberDTO.setAuthenticState("2");
		return checkMemberDAO.checkUpdate(memberDTO);
	}
	
	@Transactional
	public int deleteTran(String email){
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setAuthenticState("0");

		int result1 = checkMemberDAO.delete(email);
		System.out.println("지웠음");
		int result2 = checkMemberDAO.checkUpdate(memberDTO);
		
		
		int result = 0;
		
		if(result1>0 && result2>0){
			result = 1;
		}
		System.out.println("result: "+result);
		return result;
	
	}
	

	
}

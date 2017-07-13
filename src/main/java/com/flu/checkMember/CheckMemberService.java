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

	public int insertTran(CheckMemberDTO checkMemberDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(checkMemberDTO.getEmail());
		memberDTO.setAuthenticState("1");
		int result1 = checkMemberDAO.checkUpdate(memberDTO);
		int result2 = checkMemberDAO.insert(checkMemberDTO);
		System.out.println("업데이트:"+result1);
		System.out.println("체크멤버인서트:"+result2);
		
		int result = 0;
		
		if(result1>0 && result2>0){
			result = 1;
		}
		System.out.println("result: "+result);
		return result;
	}
	
	
	public List<CheckMemberViewDTO> list(ListInfo listInfo){
		return checkMemberDAO.list(listInfo);
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
	
	public int deleteTran(String email){
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberDTO.setAuthenticState("0");
		
		int result1 = checkMemberDAO.delete(email);
		int result2 = checkMemberDAO.checkUpdate(memberDTO);
		
		int result = 0;
		
		if(result1>0 && result2>0){
			result = 1;
		}
		System.out.println("result: "+result);
		return result;
	
	}
	
	
	
	
	
	//loginTest
	public MemberDTO loginTest(MemberDTO memberDTO){
		return checkMemberDAO.loginTest(memberDTO);
	}
	
	
}

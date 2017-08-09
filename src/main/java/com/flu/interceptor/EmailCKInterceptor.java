package com.flu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flu.member.MemberDTO;

public class EmailCKInterceptor extends HandlerInterceptorAdapter{

	//로그인 한 사람들중 이메일 인증 여부를 확인함
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try{
			if(request.getSession().getAttribute("member") != null){
				if(!((MemberDTO)request.getSession().getAttribute("member")).getEmailcheck().equals("1")){
					System.out.println("체크값1아님 이메일 인증 안됨");
					response.sendRedirect("/flu/member/emailCK");
					return false;
				}else{
					System.out.println("체크값1임 이메일 인증 됨");
					return true;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
}

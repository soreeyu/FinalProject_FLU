package com.flu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flu.member.MemberDTO;

public class MyPageEmailInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("마이페이지 인터셉터 들어옴");
		System.out.println("파라미터 이메일 : "+request.getParameter("email"));
		String email = ((MemberDTO)request.getSession().getAttribute("member")).getEmail();
		String paramEmail = request.getParameter("email");
		if(paramEmail == null){
			paramEmail = "";
		}
		if(!paramEmail.equals(email)){
			System.out.println("파라미터 이메일 넘어감");
			if(paramEmail.equals("")){
				System.out.println("세션이메일 임");
				request.setAttribute("email", email);
			}else{
				System.out.println("파라미터 이메일임");
			request.setAttribute("email", paramEmail);
			}
		}else{
			System.out.println("세션이메일 넘어감");
			request.setAttribute("email", email);
		}
		
		return true;
	}
}

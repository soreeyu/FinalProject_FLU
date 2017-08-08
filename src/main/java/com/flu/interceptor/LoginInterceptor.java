package com.flu.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.runner.Request;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flu.member.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		try{
			if(request.getSession().getAttribute("member") == null){
				System.out.println("세션이 없음");
					response.sendRedirect("/flu/member/login");
				
					return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
	}
	
	
}

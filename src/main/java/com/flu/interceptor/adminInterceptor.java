package com.flu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flu.member.MemberDTO;

public class adminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String type = ((MemberDTO)(request.getSession().getAttribute("member"))).getType();
		
		System.out.println("check관련 접근자:"+type);
		
		if(!type.equals("admin")){
			modelAndView.setViewName("error/noAccess");
		}
		
	}
	

	
}

package com.flu.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/file/**")
public class FileController {

	@RequestMapping(value="fileDown", method=RequestMethod.GET)
	public ModelAndView fileDown(String fname, HttpSession session){
		String realPath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(realPath, fname);
		
		//다운로드 할수 있는 클래스로 연결해야 한다.
		ModelAndView mv = new ModelAndView();
		mv.setViewName("download");//뷰의 이름을 클래스명이랑 동일한 이름으로 해야한다.
		mv.addObject("downloadFile", f);
		
		//뷰페이지로 가는 것이 아닌 다운로드가 되어야 한다.
		return mv;
	}
	
	
	
	
}

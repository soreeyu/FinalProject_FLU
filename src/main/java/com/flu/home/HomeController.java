package com.flu.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.tproject.EchoHandler;


@Controller
public class HomeController {
	
	@Inject
	private EchoHandler echoHandler; 
	@Inject
	private ProjectService projectService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<ProjectDTO> countList = projectService.roomCount();
		echoHandler.roomCount(countList);

		if(session.getAttribute("member") == null){
			return "index";
		}else{
			return "redirect:/member/myflu";
		}
		
	}
	@RequestMapping(value="/home")
	public String test(){
		
		return "home";
	}
	
}

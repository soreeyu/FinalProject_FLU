package com.flu.tproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.project.ProjectDTO;

public class EchoHandler extends TextWebSocketHandler{

	private Map<Integer, List<WebSocketSession>> roomList = new HashMap<Integer, List<WebSocketSession>>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Inject
	private ApplicantService applicantService;
	private List<ApplicantDTO> appList;
	private String email;
	
	public void roomCount(List<ProjectDTO> par){	
		for(int i=0;i<par.size();i++){
			List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
			this.roomList.put(par.get(i).getProjectNum(), sessionList);
			System.out.println("서버 켜자마자 방만듬");
			System.out.println("webSession:"+roomList.get(par.get(i).getProjectNum()));

		}

		
		
	}
	
	//하나의 프로젝트를 수행하고 있는 놈들 불러오기
	public void applicantList(Integer projectNum){
		this.appList = applicantService.chatList(projectNum);
		System.out.println("프로젝트 참여자 다 들고옴");
	}
	
	//session ID 불러오기
	public void setId(String email) {
		this.email = email;
	}
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		

		System.out.println("방들어오는 메소드");
		
		this.applicantList(7777);
		System.out.println(this.appList.get(0).getEmail());
		System.out.println(this.appList.get(1).getEmail());
		
		System.out.println("프로젝트 참여자 리스트 불러오기 성공");
		System.out.println("---------------------------------");
		
		System.out.println("지금 아이디: "+this.email);
		
			
/*		for(int j=0;j<this.appList.size();j++){
				
				System.out.println("2");

				if(email.equals(this.appList.get(j).getEmail())){//접속한 놈이랑 방입장되는 리스트랑 비교
					System.out.println("3");
					this.roomList.get(7777).add(session);//그놈을 그 방에 넣어줘야지
					logger.info("{} 연결됨", session.getId());
					
				}
				
			}*/
		
	

		
		logger.info("{} 연결됨", session.getId());
		System.out.println("1번");

	}

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("메세지 전송 전");
		

		for(int i=0;i<roomList.get(7777).size();i++){
			
			for(WebSocketSession sess : roomList.get(7777)){
				sess.sendMessage(new TextMessage(session.getRemoteAddress().getHostName()+":"+message.getPayload()));
				logger.info("{}로부터 {} 받음", session.getId(),message.getPayload());
				System.out.println("444");
			}
		}
			
			
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		List<WebSocketSession> sessionList = roomList.get(7777);
		
		sessionList.remove(session);
		logger.info("{} 연결끊김", session.getId());
		System.out.println("3번");
		//System.out.println("채팅방 퇴장자: "+session.getPrincipal().getName());
		
	}
	
	
}

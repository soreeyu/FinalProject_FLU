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
	private Integer projectNum;
	

	public void roomCount(List<ProjectDTO> par){	
		System.out.println("채팅방 들어갈때 방만듬");
		
		for(int i=0;i<par.size();i++){	
			if(roomList.get(par.get(i).getProjectNum())==null){	
				List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
				this.roomList.put(par.get(i).getProjectNum(), sessionList);

				System.out.println("webSession:"+roomList.get(par.get(i).getProjectNum()));	
			}

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
	public void setNum(Integer projectNum){
		this.projectNum = projectNum;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("방들어오는 메소드");
		System.out.println("방번호:"+this.projectNum);
		Map<String, Object> mapSession = session.getAttributes();
		
		mapSession.put(session.getId(), this.projectNum);
		
		System.out.println("주어진 세션아이디: "+session.getId());
		
		this.roomList.get(this.projectNum).add(session);
		System.out.println("지금 아이디: "+this.email);
	
	}

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		
		System.out.println("메세지 전송 전");
		System.out.println("주어진 세션아이디로 꺼낸 프로젝트 번호: "+session.getAttributes().get(session.getId()));
		
			for(WebSocketSession sess : roomList.get(session.getAttributes().get(session.getId()))){
				sess.sendMessage(new TextMessage(session.getRemoteAddress().getHostName()+":"+message.getPayload()));
				logger.info("{}로부터 {} 받음", session.getId(),message.getPayload());
				System.out.println("메세지 전송 확인");
			}
	
			System.out.println(session.getId()+"가 메세지보냄");

	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		roomList.get(this.projectNum).remove(session);
		logger.info("{} 연결끊김", session.getId());
		System.out.println("3번");
		//System.out.println("채팅방 퇴장자: "+session.getPrincipal().getName());
		
	}
	
	
}

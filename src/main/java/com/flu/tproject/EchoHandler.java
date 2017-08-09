package com.flu.tproject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.flu.project.ProjectDTO;

public class EchoHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList;
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private Map<Integer, Object> room;
	
	
	public Map<Integer, Object> roomCount(List<ProjectDTO> par){
		
		for(int i=0;i<par.size();i++){
			sessionList = new ArrayList<WebSocketSession>();
			room.put(par.get(i).getProjectNum(), sessionList);
		}
		return room;
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("{}로부터 {} 받음", session.getId(),message.getPayload());
		
		
		for(WebSocketSession sess : sessionList){
			sess.sendMessage(new TextMessage(session.getRemoteAddress().getHostName()+":"+message.getPayload()));
		}
		
		System.out.println(session.getId()+"가 메세지보냄");
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		logger.info("{} 연결끊김", session.getId());
		
		//System.out.println("채팅방 퇴장자: "+session.getPrincipal().getName());
		
	}
	
	
}

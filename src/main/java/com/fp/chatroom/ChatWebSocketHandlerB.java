package com.fp.chatroom;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fp.member.MemberDTO;

public class ChatWebSocketHandlerB extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	List<String> guestlist = new ArrayList<String>();
	
	String data = "접속자:";
	String usercount ="유저수:";

	@Override

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session);
	
		Map<String, Object> map = session.getAttributes();
		Iterator<String> iter = session.getAttributes().keySet().iterator();
		MemberDTO memberDTO = (MemberDTO)map.get(iter.next());
	
		guestlist.add(memberDTO.getName());
		
		usercount= "유저수:" + guestlist.size();
		
		data = "접속자:";
		data = data +"<div>"+ "<img src='resources/images/online.png'>" + " "+ guestlist.get(0)+"</div>";
		for(int i=1; i< guestlist.size();i++){
			data = data +"<div style='margin-top:3%;'>"+ "<img src='resources/images/online.png'>" + " "+ guestlist.get(i)+"</div>";
			/*addguestlist(session);*/

		}
		System.out.println(data);
		System.out.println(usercount);
		for (WebSocketSession s : users.values()) {
			if(!session.getId().equals(s)){
				s.sendMessage(new TextMessage(usercount));
				s.sendMessage(new TextMessage(data));
				
			}
		}
		

	}



	@Override

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		Iterator<String> iter = session.getAttributes().keySet().iterator();
		
		MemberDTO memberDTO = (MemberDTO)map.get(iter.next());
		
		data = "접속자:";
		log(session.getId() + " 연결 종료됨");
		for(int i=0; i< guestlist.size();i++){
			if((guestlist.get(i)).equals(memberDTO.getName())){
				guestlist.remove(i);
				break;
			}
		}
		users.remove(session.getId());
		
		usercount= "유저수:" + guestlist.size();
		
		System.out.println(usercount);
		
	


		for (WebSocketSession s : users.values()){
			System.out.println(s.getId());
		}
		data = data + "<div>"+ "<img src='resources/images/online.png'>" + " "+guestlist.get(0)+"</div>";
		for(int i=1; i< guestlist.size();i++){
			data = data +  "<div style='margin-top:3%;'>"+ "<img src='resources/images/online.png'>" + " "+ guestlist.get(i)+"</div>";
			/*addguestlist(session);*/

		}
		System.out.println(data);
		for (WebSocketSession s : users.values()) {
			if(!session.getId().equals(s)){
				s.sendMessage(new TextMessage(usercount));
				s.sendMessage(new TextMessage(data));
				
			}
		}

	}



	@Override

	protected void handleTextMessage(

			WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());

		//System.out.println("session:" + session + "txtmessage: " + message);

		for (WebSocketSession s : users.values()) {
			if(!session.getId().equals(s)){
				s.sendMessage(message);
			}
			log(s.getId() + "에 메시지 발송: " + message.getPayload());

		}

	}



	@Override

	public void handleTransportError(

			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}



	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}
	
	

}

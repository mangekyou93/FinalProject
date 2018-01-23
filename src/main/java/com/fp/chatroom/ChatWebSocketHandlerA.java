package com.fp.chatroom;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fp.member.MemberDTO;

public class ChatWebSocketHandlerA extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
		
	List<String> guestlist = new ArrayList<String>();
	
	HttpSession httpsession;

	String data = "접속자:";
	/*	public ModelAndView addguestlist(WebSocketSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<String> list = new ArrayList<String>();
		String guest= null;;
		for (WebSocketSession s : users.values()){
			guest =s.getId();
			list.add(guest);
		}
		mv.addObject("guestlist", list);
		mv.addObject("asd", "asdf");
		mv.setViewName("chatting/chatA");

		return mv;

	}*/
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session);
		
		Map<String, Object> map = session.getAttributes();
		Iterator<String> iter = session.getAttributes().keySet().iterator();
		
		MemberDTO memberDTO = (MemberDTO)map.get(iter.next());

		guestlist.add(memberDTO.getName());
		
		/*for(int i=0; i< guestlist.size();i++){
			if(i<guestlist.size()){
			data = data + guestlist.get(i) + ",";
			}
			else if(i==guestlist.size()){
				data = data + guestlist.get(i);
			}

		}*/
		data = "접속자:";
		data = data + guestlist.get(0);
		for(int i=1; i< guestlist.size();i++){
			data = data +  " " + guestlist.get(i);
			/*addguestlist(session);*/

		}
		System.out.println(data);
		for (WebSocketSession s : users.values()) {
			if(!session.getId().equals(s)){
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


		for (WebSocketSession s : users.values()){
			System.out.println(s.getId());
		}
		data = data + guestlist.get(0);
		for(int i=1; i< guestlist.size();i++){
			data = data +  " " + guestlist.get(i);
			/*addguestlist(session);*/

		}
		System.out.println(data);
		for (WebSocketSession s : users.values()) {
			if(!session.getId().equals(s)){
				s.sendMessage(new TextMessage(data));
			}
		}

	}



	@Override

	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
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

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}



	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}






}


package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.chatroom.ChatRoomService;

@Controller
public class ChatRoomController {

	@RequestMapping("/chat")
	public String viewChattingPage1(){
		return "chatting/chat";
	}
	
	@RequestMapping("/chat2")
	public String viewChattingPage2(){
		return "chatting/chat2";
	}
	
	@RequestMapping("/chat3")
	public String viewChattingPage3(){
		return "chatting/chat3";
	}
	
}

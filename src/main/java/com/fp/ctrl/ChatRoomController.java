package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.chatroom.ChatRoomService;

@Controller
public class ChatRoomController {

	@RequestMapping("/chatA")
	public String viewChattingPage1(){
		return "chatting/chatA";
	}
	
	@RequestMapping("/chatB")
	public String viewChattingPage2(){
		return "chatting/chatB";
	}
	
	@RequestMapping("/chatC")
	public String viewChattingPage3(){
		return "chatting/chatC";
	}
	
	@RequestMapping("/chatD")
	public String viewChattingPage4(){
		return "chatting/chatD";
	}
	
	
	@RequestMapping("/room")
	public String room(){
		return "chatting/room";
	}
	

	@RequestMapping("/chatting")
	public String chatting(){
		return "chatting/chatting";
	}
	
	@RequestMapping("/test")
	public String test(){
		return "chatting/test";
	}
	
}

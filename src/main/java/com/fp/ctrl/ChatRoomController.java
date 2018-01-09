package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.chatroom.ChatRoomService;

@Controller
public class ChatRoomController {

	@RequestMapping("/chat")
	public String viewChattingPage1(String one, Model model){
		model.addAttribute("one", one);
		return "chatting/chat";
	}
	
	@RequestMapping("/chat2")
	public String viewChattingPage2(){
		return "chatting/chat2";
	}
	
}

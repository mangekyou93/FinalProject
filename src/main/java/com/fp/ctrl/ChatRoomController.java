package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.chatroom.ChatRoomService;

@Controller
@RequestMapping(value="/chatroom/*")
public class ChatRoomController {

	@Inject
	ChatRoomService chatRoomService;
	
}

package com.fp.chatroom;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ChatRoomService {

	@Inject
	ChatRoomDAO chatRoomDAO;
}

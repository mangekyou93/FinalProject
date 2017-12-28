package com.fp.chatroom;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "chatroomMapper.";
	
}

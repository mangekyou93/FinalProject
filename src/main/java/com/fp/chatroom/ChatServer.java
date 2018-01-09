package com.fp.chatroom;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ChatServer extends ChatWebSocketHandler {
	public Map <Integer, ChatWebSocketHandler> rooms= new ConcurrentHashMap<Integer, ChatWebSocketHandler>();
}

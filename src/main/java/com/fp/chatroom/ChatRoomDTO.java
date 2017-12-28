package com.fp.chatroom;

public class ChatRoomDTO {

	private int member_seq;
	private int room_number;
	private String chat_file;
	private String last_chat;
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	public String getChat_file() {
		return chat_file;
	}
	public void setChat_file(String chat_file) {
		this.chat_file = chat_file;
	}
	public String getLast_chat() {
		return last_chat;
	}
	public void setLast_chat(String last_chat) {
		this.last_chat = last_chat;
	}
	
	
}

package com.owl.chat.dto;

public class ChatUser {
	private int chatUserIdx;
	private String email;
	private String name;
	public int getChatUserIdx() {
		return chatUserIdx;
	}
	public void setChatUserIdx(int chatUserIdx) {
		this.chatUserIdx = chatUserIdx;
	}
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ChatUser [chatUserIdx=" + chatUserIdx + ", email=" + email + ", name=" + name + "]";
	}
	
	
	
	

}

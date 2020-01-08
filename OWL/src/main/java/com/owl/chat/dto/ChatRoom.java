package com.owl.chat.dto;

import java.util.List;

public class ChatRoom {
	private int chatIdx;
	private String name;
	//private List<>
	private List<ChatUser> chatUsers;
	private ChatType typeCode;
	
	enum ChatType {
		P,
		ONO,
		G
	}

	public int getChatIdx() {
		return chatIdx;
	}

	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ChatUser> getChatUsers() {
		return chatUsers;
	}

	public void setChatUsers(List<ChatUser> chatUsers) {
		this.chatUsers = chatUsers;
	}

	public ChatType getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(ChatType typeCode) {
		this.typeCode = typeCode;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatIdx=" + chatIdx + ", name=" + name + ", chatUsers=" + chatUsers + ", typeCode=" + typeCode
				+ "]";
	}
	
	
	
	
}

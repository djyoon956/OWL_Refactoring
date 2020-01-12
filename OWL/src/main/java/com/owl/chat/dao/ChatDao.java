package com.owl.chat.dao;

import java.sql.SQLException;

import com.owl.chat.dto.ChatRoom;
import com.owl.chat.dto.ChatUser;

public interface ChatDao {
	// ChatRoom
	public int insertChatRoom(ChatRoom room) throws ClassNotFoundException, SQLException;

	public int deleteChatRoom(ChatRoom room) throws ClassNotFoundException, SQLException;

	// ChatUser
	public int insertChatUser(ChatUser user) throws ClassNotFoundException, SQLException;

	public int deleteChatUser(ChatUser user) throws ClassNotFoundException, SQLException;
}

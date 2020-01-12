package com.owl.chat.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.chat.dao.ChatDao;
import com.owl.chat.dto.ChatRoom;

@Service
public class ChatService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertChatRoom(ChatRoom room) {
		ChatDao dao = getChatDao();
		boolean result = false;

		try {
			result = dao.insertChatRoom(room) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private ChatDao getChatDao() {
		return sqlSession.getMapper(ChatDao.class);
	}
}

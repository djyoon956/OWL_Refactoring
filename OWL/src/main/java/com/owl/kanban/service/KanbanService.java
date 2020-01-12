package com.owl.kanban.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.kanban.dao.KanbanDao;
import com.owl.kanban.dto.Issue;

@Service
public class KanbanService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertIssue(Issue issue) {
		KanbanDao dao = getKanbanDao();
		boolean result = false;

		try {
			result = dao.insertIssue(issue) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private KanbanDao getKanbanDao() {
		return sqlSession.getMapper(KanbanDao.class);
	}
}

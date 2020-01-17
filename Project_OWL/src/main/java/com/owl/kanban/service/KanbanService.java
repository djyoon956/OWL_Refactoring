package com.owl.kanban.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.kanban.dao.KanbanDao;
import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;

@Service
public class KanbanService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertIssue(Issue issue) {
		System.out.println("insertIssue service in");
		System.out.println(issue.toString());
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

	
	
	
	public List<Member>getAssignees(int projectIdx) {
		KanbanDao dao = getKanbanDao();
		Member member = null;
		
		try {
			member = dao.selectProjectMember(projectIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return null;
	}
	
	
	
	private KanbanDao getKanbanDao() {
		return sqlSession.getMapper(KanbanDao.class);
	}
}

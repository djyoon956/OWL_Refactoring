package com.owl.kanban.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.owl.kanban.service.KanbanService;
import com.owl.member.dto.Member;
import com.owl.member.service.MemberService;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;

@RestController
public class KanbanRestController {
	@Autowired
	private SqlSession sqlSession;

	
	@Autowired
	private KanbanService service;
	
	
	@RequestMapping("GetKanban.do")
	public List<Notice> getNotices(int projectIdx) {
		System.out.println("getNotices : " + projectIdx);
		NoticeDao dao = getNoticeDao();
		List<Notice> notices = null;
		try {
			notices = dao.getNoticesByProjectIdx(projectIdx);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return notices;
	}

	
	@RequestMapping("Assignees.do")
	public List<Member> getAssignees(int projectIdx) {
		System.out.println("여기는 getAssignees 함수 : " + projectIdx);
		List<Member> member = null;
		member = service.getAssignees(projectIdx);
		return member;
	}
	
	
	
	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
}

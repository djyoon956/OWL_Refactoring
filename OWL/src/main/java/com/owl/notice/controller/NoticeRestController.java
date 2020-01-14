package com.owl.notice.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;

@RestController
public class NoticeRestController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("GetNotices.do")
	public List<Notice> getNotices(int projectIdx) {
		System.out.println("getNotices : "+projectIdx);
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

	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
}

package com.owl.notice.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;


@Service
public class NoticeService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertNotice(Notice notice) {
		NoticeDao dao = getNoticeDao();
		boolean result = false;

		try {
			result = dao.insertNotice(notice) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Notice> getNoticesByProjectIdx(int projectIdx) {
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

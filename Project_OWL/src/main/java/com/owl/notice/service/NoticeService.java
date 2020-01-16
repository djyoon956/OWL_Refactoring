package com.owl.notice.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;


@Service
public class NoticeService {
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public boolean insertNotice(Notice notice) throws Exception{
		NoticeDao dao = getNoticeDao();
		boolean result = false;
		System.out.println(notice.getEmail());
		try {
			result = dao.insertNotice(notice) > 0 ? true : false;
			System.out.println(notice.getNoticeIdx());
			
			if (notice.getFiles().size() > 0) {
				// 파일 insert
			}
			
		} catch (Exception e) {
			System.out.println("Trans 예외 발생 : " + e.getMessage());
			throw e; // 이 시점에 매니저가 예외 인지 한 후 rollback 처리
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

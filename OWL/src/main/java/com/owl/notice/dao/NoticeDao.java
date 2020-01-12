package com.owl.notice.dao;

import java.sql.SQLException;

import com.owl.notice.dto.Notice;

public interface NoticeDao {
	public int insertNotice(Notice notice) throws ClassNotFoundException, SQLException;

	public int deleteNotice(int noticeIdx) throws ClassNotFoundException, SQLException;
}

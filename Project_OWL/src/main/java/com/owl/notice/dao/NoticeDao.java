package com.owl.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.notice.dto.Notice;

public interface NoticeDao {
	public int insertNotice(Notice notice) throws ClassNotFoundException, SQLException;
	
	public int insertNoticeFile(Notice notice) throws ClassNotFoundException, SQLException;

	public int deleteNotice(int noticeIdx) throws ClassNotFoundException, SQLException;
	
	public List<Notice> getNoticesByProjectIdx(int projectIdx) throws ClassNotFoundException, SQLException;
}

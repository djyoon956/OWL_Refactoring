package com.owl.kanban.dao;

import java.sql.SQLException;

import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;
import com.owl.notice.dto.File;

public interface KanbanDao {
	public Member selectProjectMember(int projectIdx) throws ClassNotFoundException, SQLException;

	public int insertIssue(Issue issue) throws ClassNotFoundException, SQLException;
	
	public int insertIssueFile(File file) throws ClassNotFoundException, SQLException;

	public int insertColumn(Column column) throws ClassNotFoundException, SQLException;

	public int insertIssueLog(Issue issue) throws ClassNotFoundException, SQLException;
}

package com.owl.kanban.dao;

import java.sql.SQLException;

import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;

public interface KanbanDao {
	public Member selectProjectMember(int projectIdx) throws ClassNotFoundException, SQLException;

	public int insertIssue(Issue issue) throws ClassNotFoundException, SQLException;

	public int insertColumn(int projectIdx, String colname) throws ClassNotFoundException, SQLException;

	public int insertIssueLog(Issue issue) throws ClassNotFoundException, SQLException;
}

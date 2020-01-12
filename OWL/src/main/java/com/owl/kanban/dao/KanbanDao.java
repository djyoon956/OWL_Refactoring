package com.owl.kanban.dao;

import java.sql.SQLException;

import com.owl.kanban.dto.Issue;

public interface KanbanDao {
	public int insertIssue(Issue issue) throws ClassNotFoundException, SQLException;

	public int insertIssueLog(Issue issue) throws ClassNotFoundException, SQLException;
}

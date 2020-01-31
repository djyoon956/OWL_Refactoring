package com.owl.dashBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.dashBoard.dto.IssueTask;

public interface DashBoardDao {
	public int checkJoinProject(String email) throws ClassNotFoundException, SQLException;
	
	public List<IssueTask> getMyIssueTasks(String assigned) throws ClassNotFoundException, SQLException;

	public List<IssueTask> getProjectIssueTasks() throws ClassNotFoundException, SQLException;
	
}

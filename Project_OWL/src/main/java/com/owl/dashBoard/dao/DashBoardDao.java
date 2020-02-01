package com.owl.dashBoard.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.dashBoard.dto.IssueTask;
import com.owl.dashBoard.dto.ProjectProgress;
import com.owl.dashBoard.dto.TimeLine;

public interface DashBoardDao {
	public int checkJoinProject(String email) throws ClassNotFoundException, SQLException;

	public List<IssueTask> getMyIssueTasks(String assigned) throws ClassNotFoundException, SQLException;

	public List<IssueTask> getProjectIssueTasks(int projectIdx) throws ClassNotFoundException, SQLException;

	public List<IssueTask> getMyIssueTasksByProject(int projectIdx, String assigned) throws ClassNotFoundException, SQLException;

	public List<ProjectProgress> getMyProjectChart(String email) throws ClassNotFoundException, SQLException;

	public List<ProjectProgress> getProgressChart(String assigned, int projectIdx) throws ClassNotFoundException, SQLException;

	public List<ProjectProgress> getProjectChart(int projectIdx) throws ClassNotFoundException, SQLException;

	public List<TimeLine> getMyTimeLines(String email) throws ClassNotFoundException, SQLException;

	public List<ProjectProgress> getLabelChart(int projectIdx) throws ClassNotFoundException, SQLException;
	
	public List<ProjectProgress> getHorizonChart(String email) throws ClassNotFoundException, SQLException;
}

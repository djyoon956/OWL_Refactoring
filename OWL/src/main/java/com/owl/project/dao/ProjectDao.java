package com.owl.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.project.dto.Project;
import com.owl.project.dto.ProjectList;

public interface ProjectDao {
	public int insertProject(Project project) throws ClassNotFoundException, SQLException;
	
	public int insertProjectList(ProjectList projectlist) throws ClassNotFoundException, SQLException;

	public int updateProjectList(ProjectList projectlist) throws ClassNotFoundException, SQLException;

	public Project getProject(int projectIdx) throws ClassNotFoundException, SQLException;

	public List<ProjectList> getProjectLists(String email) throws ClassNotFoundException, SQLException;

	public ProjectList getProjectList(int projectIdx, String email) throws ClassNotFoundException, SQLException;
	
} 

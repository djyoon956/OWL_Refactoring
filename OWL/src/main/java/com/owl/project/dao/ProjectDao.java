package com.owl.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.member.dto.Member;
import com.owl.project.dto.Project;
import com.owl.project.dto.ProjectList;

public interface ProjectDao {
	public int insertProject(Project project) throws ClassNotFoundException, SQLException;
	
	public int insertProjectList(ProjectList projectlist) throws ClassNotFoundException, SQLException;

	public int updateProjectList(Member member) throws ClassNotFoundException, SQLException;

	public Project getProject(int projectIdx) throws ClassNotFoundException, SQLException;

	public List<Project> getProjectLists(String email) throws ClassNotFoundException, SQLException;

}

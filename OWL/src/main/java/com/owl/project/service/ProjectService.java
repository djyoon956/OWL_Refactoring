package com.owl.project.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.owl.member.dao.MemberDao;
import com.owl.member.dto.Member;
import com.owl.project.dao.ProjectDao;
import com.owl.project.dto.Project;
import com.owl.project.dto.ProjectList;

@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlSession;

	// Sidebar의 프로젝트 목록 출력
	public List<ProjectList> getProjectLists(String email) {
		ProjectDao projectDao = getProjectDao();
		List<ProjectList> projectlist = new ArrayList<ProjectList>();

		try {
			projectlist = projectDao.getProjectLists(email);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return projectlist;
	}

	// Sidebar의 프로젝트 목록 수정
	public boolean updateProjectList(ProjectList projectlist) {
		ProjectDao projectDao = getProjectDao();
		boolean result = false;

		try {
			result = projectDao.updateProjectList(projectlist) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	//Sidebar의 프로젝트 목록 추가
	
	@Transactional
	public boolean insertNewProject(Project project, ProjectList projectlist) throws Exception{
		ProjectDao projectDao = getProjectDao();
		boolean result = false;

		try {
			projectDao.insertProject(project);
			projectlist.setProjectIdx(project.getProjectIdx());
			projectDao.insertProjectList(projectlist);
			result = true;
		} catch (Exception e) {
			System.out.println("Trans 예외 발생 : " + e.getMessage());
			throw e; //이 시점에 매니저가 예외 인지 한 후 rollback 처리
		}
		return result;
	}
	
	public ProjectList getProjectList(int projectIdx, String email) {
		ProjectDao dao = getProjectDao();
		ProjectList projectList = null;
		try {
			projectList = dao.getProjectList(projectIdx, email);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return projectList;
	}
	
	private ProjectDao getProjectDao() {
		return sqlSession.getMapper(ProjectDao.class);
	}
}

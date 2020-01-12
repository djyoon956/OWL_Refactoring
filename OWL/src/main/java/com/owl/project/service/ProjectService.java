package com.owl.project.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.project.dao.ProjectDao;
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

	private ProjectDao getProjectDao() {
		return sqlSession.getMapper(ProjectDao.class);
	}
}

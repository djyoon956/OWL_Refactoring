package com.owl.project.service;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.owl.drive.dao.DriveDao;
import com.owl.drive.dto.DriveFolder;
import com.owl.helper.UploadHelper;
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
	public boolean insertNewProject(Project project, ProjectList projectlist, DriveFolder drivefolder, HttpServletRequest request) throws Exception{
		ProjectDao projectDao = getProjectDao();
		DriveDao driveDao = getDriveDao();
		boolean result = false;

		try {
			projectDao.insertProject(project);
			
			int projectIdx = project.getProjectIdx();
			projectlist.setProjectIdx(projectIdx);
			projectlist.setAuthority("ROLE_PM");

			projectDao.insertProjectList(projectlist);	
			
			String folderName = project.getProjectName();
			String uploadPath = request.getServletContext().getRealPath("upload");
			UploadHelper.makeDriveDirectory(uploadPath, projectIdx, folderName);
			
			drivefolder.setFolderName(folderName);
			drivefolder.setProjectIdx(projectIdx);
			
			driveDao.insertFolder(drivefolder);
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

	public boolean insertProjectMember(int projectIdx, String pm, String email) {
		ProjectDao dao = getProjectDao();
		boolean result = false;
		ProjectList projectList = new ProjectList();
		projectList.setAuthority("ROLE_PROJECTMEMBER");
		projectList.setEmail(email);
		projectList.setProjectIdx(projectIdx);
		System.out.println(projectIdx);
		System.out.println(pm);
		System.out.println(email);
		try {
			projectList.setProjectColor(dao.getProjectList(projectIdx, pm).getProjectColor());
			result = dao.insertProjectMember(projectList) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Member> getProjectMembers(int projectIdx) {
		ProjectDao dao = getProjectDao();
		List<Member> projectMembers = new ArrayList<>();
		try {
			projectMembers = dao.getProjectMembers(projectIdx);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return projectMembers;
	}
	
	public boolean outProject(int projectIdx, String email) {
		ProjectDao dao = getProjectDao();
		System.out.println("in outProject service");
		boolean result =false;
		try {
			result = dao.outProject(projectIdx, email) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("result : "+result);
		return result;
	}
	
	private ProjectDao getProjectDao() {
		return sqlSession.getMapper(ProjectDao.class);
	}
	
	private DriveDao getDriveDao() {
		return sqlSession.getMapper(DriveDao.class);
	}	
}

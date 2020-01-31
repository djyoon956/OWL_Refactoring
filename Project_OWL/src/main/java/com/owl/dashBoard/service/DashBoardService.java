package com.owl.dashBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.dashBoard.dao.DashBoardDao;
import com.owl.dashBoard.dto.IssueTask;
import com.owl.dashBoard.dto.ProjectProgress;

@Service
public class DashBoardService {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 멤버가 참여중인 프로젝트가 존재하는지 체크
	 * @author 윤다정
	 * @since 2020/01/31
	 * @param email
	 * @return int
	 */
	public int checkJoinProject(String email) {
		int result =0;
		DashBoardDao dao = getDashBoardDao();
		try {
			result = dao.checkJoinProject(email);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * MyDashBoard - Issue 테이블 데이터 구하기
	 * @author 윤다정
	 * @since 2020/01/31
	 * @param projectidx
	 * @param assigned
	 * @return List<IssueTask>
	 */
	public List<IssueTask> getMyIssueTasks(String assigned) {
		DashBoardDao dao = getDashBoardDao();
		System.out.println("in getMyIssueTasks service");
		List<IssueTask> issueTasks = new ArrayList<IssueTask>();
		try {
			issueTasks = dao.getMyIssueTasks(assigned);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return issueTasks;
	}
	
	/**
	 * 본인에게 할달된 이슈 진행률(프로젝트 별)
	 * @author 이정은
	 * @since 2020/01/31
	 * @param email
	 * @return progress
	 */
	public List<ProjectProgress> getMyProjectChart(String email){
		DashBoardDao dao = getDashBoardDao();
		List<ProjectProgress> progress = new ArrayList<ProjectProgress>();
		try {
			progress = dao.getMyProjectChart(email);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
		return progress;		
	}
	
	/**
	 * DashBoardDao 구하기
	 * 
	 * @author 윤다정
	 * @since 2020/01/31
	 * @return DashBoardDao
	 */
	private DashBoardDao getDashBoardDao() {
		return sqlSession.getMapper(DashBoardDao.class);
	}
}

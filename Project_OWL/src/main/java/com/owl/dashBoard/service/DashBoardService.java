package com.owl.dashBoard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.dashBoard.dao.DashBoardDao;
import com.owl.dashBoard.dto.IssueTask;

@Service
public class DashBoardService {
	@Autowired
	private SqlSession sqlSession;

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

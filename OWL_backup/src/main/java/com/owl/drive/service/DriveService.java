package com.owl.drive.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.drive.dao.DriveDao;
import com.owl.drive.dto.Drive;

@Service
public class DriveService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertDriveFolder(Drive drive) {
		DriveDao dao = getDriveDao();
		boolean result = false;

		try {
			result = dao.insertFolder(drive) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private DriveDao getDriveDao() {
		return sqlSession.getMapper(DriveDao.class);
	}
}

package com.owl.drive.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.drive.dao.DriveDao;
import com.owl.drive.dto.DriveFolder;

@Service
public class DriveService {
	@Autowired
	private SqlSession sqlSession;

	public boolean insertDriveFolder(DriveFolder drivefolder) {
		DriveDao dao = getDriveDao();
		boolean result = false;

		try {
			result = dao.insertFolder(drivefolder) > 0 ? true : false;
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

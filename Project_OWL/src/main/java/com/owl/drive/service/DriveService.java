package com.owl.drive.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.owl.drive.dao.DriveDao;
import com.owl.drive.dto.DriveFile;
import com.owl.drive.dto.DriveFolder;
import com.owl.helper.UploadHelper;

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

	public List<DriveFolder> getDriveList(int projectIdx) {
		DriveDao dao = getDriveDao();
		List<DriveFolder> folders = new ArrayList<DriveFolder>();

		try {
			folders = dao.getDriveList(projectIdx);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return folders;
	}
	
	public boolean insertFile(DriveFile file) {
		DriveDao dao = getDriveDao();
		boolean result = false;
		
		try {
			result = dao.insertFile(file) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<DriveFile> getFolderData(int folderIdx) {
		System.out.println("in getFolderDatas service : " + folderIdx);
		DriveDao dao = getDriveDao();

		List<DriveFile> files = null;
		try {
			files = dao.getFileByFolderIdx(folderIdx);
			// get folder
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return files;
	}
	
	
	public List<DriveFile> getTrachList(int projectIdx) {
		DriveDao dao = getDriveDao();
		List<DriveFile> trashlist = new ArrayList<DriveFile>();

		try {
			trashlist = dao.getTrashList(projectIdx);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return trashlist;
	}
	
	
	private DriveDao getDriveDao() {
		return sqlSession.getMapper(DriveDao.class);
	}
}

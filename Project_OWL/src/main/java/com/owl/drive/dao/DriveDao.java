package com.owl.drive.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.drive.dto.DriveFile;
import com.owl.drive.dto.DriveFolder;

public interface DriveDao {
	public int insertMainFolder(DriveFolder drivefolder) throws ClassNotFoundException, SQLException;
	
	public int insertFolder(DriveFolder drivefolder) throws ClassNotFoundException, SQLException;

	public int insertFile(DriveFile file) throws ClassNotFoundException, SQLException;
	
	public int updateNewNameFolder(String folderName, int driveIdx) throws ClassNotFoundException, SQLException;
	
	public int updateFolder(DriveFolder drivefolder) throws ClassNotFoundException, SQLException;
	
	public List<DriveFolder> getDriveList(int projectIdx) throws ClassNotFoundException, SQLException;
	
	public List<DriveFile> getFileByFolderIdx(int folderIdx) throws ClassNotFoundException, SQLException;

	public List<DriveFolder> getFolderByFolderIdx(int folderIdx) throws ClassNotFoundException, SQLException;

	public List<DriveFile> getTrashList(int projectIdx) throws ClassNotFoundException, SQLException;
	
	public int deleteFolder(int driveIdx) throws ClassNotFoundException, SQLException;

	public int deleteFileFromDrive(int driveFileIdx) throws ClassNotFoundException, SQLException;

	public int deleteFileFromTrash(int driveFileIdx) throws ClassNotFoundException, SQLException;
	
	public int renameFile(int driveFileIdx, String fileName) throws ClassNotFoundException, SQLException;
	
	public int restoreFilefromTrash(int driveFileIdx) throws ClassNotFoundException, SQLException;
	
}

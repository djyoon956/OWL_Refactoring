package com.owl.drive.dao;

import java.sql.SQLException;
import java.util.List;

import com.owl.drive.dto.DriveFile;
import com.owl.drive.dto.DriveFolder;

public interface DriveDao {
	public int insertFolder(DriveFolder drivefolder) throws ClassNotFoundException, SQLException;

	public int insertFile(DriveFile file) throws ClassNotFoundException, SQLException;
	
	public List<DriveFolder> getDriveList(int projectIdx) throws ClassNotFoundException, SQLException;
}

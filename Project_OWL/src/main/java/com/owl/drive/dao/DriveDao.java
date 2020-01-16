package com.owl.drive.dao;

import java.sql.SQLException;

import com.owl.drive.dto.DriveFile;
import com.owl.drive.dto.DriveFolder;

public interface DriveDao {
	public int insertFolder(DriveFolder drivefolder) throws ClassNotFoundException, SQLException;

	public int insertFile(DriveFile drivefile) throws ClassNotFoundException, SQLException;
}

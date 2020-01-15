package com.owl.drive.dao;

import java.sql.SQLException;

import com.owl.drive.dto.Drive;

public interface DriveDao {
	public int insertFolder(Drive drive) throws ClassNotFoundException, SQLException;

	public int insertFile(Drive drive) throws ClassNotFoundException, SQLException;
}

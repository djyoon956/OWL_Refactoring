package com.owl.drive.dto;

import java.util.Date;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class DriveFile {
	private int driveFileIdx;
	private int driveIdx;
	private String creator;
	private String fileName;
	private int fileSize;
	private Date createDate;
	private Date deleteDate;
	private boolean isDelete;
}

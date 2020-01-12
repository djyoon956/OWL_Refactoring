package com.owl.drive.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Drive {
	private int driveIdx;
	private int projecIdx;
	private String folderName;
	private String fileName;
	private String creator;
	private Date createDate;
	private Date deleteDate;
	private int ref;
	private int depth;
	private boolean isDelete;
}

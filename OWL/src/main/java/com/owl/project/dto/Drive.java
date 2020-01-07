package com.owl.project.dto;

import java.util.Date;

public class Drive {
	private int driveIdx;
	private String fileName;
	private String folderName;
	private String creator;
	private Date sDate;
	private Date dDate;
	private Boolean fileStatus;
	private int ref;
	private int depth;
	public int getDriveIdx() {
		return driveIdx;
	}
	public void setDriveIdx(int driveIdx) {
		this.driveIdx = driveIdx;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public Boolean getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(Boolean fileStatus) {
		this.fileStatus = fileStatus;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "Drive [driveIdx=" + driveIdx + ", fileName=" + fileName + ", folderName=" + folderName + ", creator="
				+ creator + ", sDate=" + sDate + ", dDate=" + dDate + ", fileStatus=" + fileStatus + ", ref=" + ref
				+ ", depth=" + depth + "]";
	}
	

	
}

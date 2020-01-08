package com.owl.project.dto;

public class File {
	private int fileIdx;
	private int belongTo;
	private String writer;
	private String fileName;
	private String filesize;
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public int getBelongTo() {
		return belongTo;
	}
	public void setBelongTo(int belongTo) {
		this.belongTo = belongTo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "File [fileIdx=" + fileIdx + ", belongTo=" + belongTo + ", writer=" + writer + ", fileName=" + fileName
				+ ", filesize=" + filesize + "]";
	}
	
	
	
	
	
	
	

}

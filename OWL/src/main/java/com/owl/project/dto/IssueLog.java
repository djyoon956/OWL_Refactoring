package com.owl.project.dto;

import java.util.Date;

public class IssueLog {
	private int logIdx;
	private String log;
	private Date time;
	public int getLogIdx() {
		return logIdx;
	}
	public void setLogIdx(int logIdx) {
		this.logIdx = logIdx;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "IssueLog [logIdx=" + logIdx + ", log=" + log + ", time=" + time + "]";
	}
	
	
	

}

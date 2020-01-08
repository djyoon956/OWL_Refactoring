package com.owl.calendar.dto;

import java.util.Date;

public class Pcalendar {
	private int calIdx;
	private Type type;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private String alarm;
	private int projectIdx;
	
	
	enum Type {
			P,
			PS
	}


	public int getCalIdx() {
		return calIdx;
	}


	public void setCalIdx(int calIdx) {
		this.calIdx = calIdx;
	}


	public Type getType() {
		return type;
	}


	public void setType(Type type) {
		this.type = type;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getAlarm() {
		return alarm;
	}


	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}


	public int getProjectIdx() {
		return projectIdx;
	}


	public void setProjectIdx(int projectIdx) {
		this.projectIdx = projectIdx;
	}


	@Override
	public String toString() {
		return "Pcalendar [calIdx=" + calIdx + ", type=" + type + ", title=" + title + ", content=" + content
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", alarm=" + alarm + ", projectIdx="
				+ projectIdx + "]";
	}
	
	
	
	
}

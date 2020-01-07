package com.owl.project.dto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class Issue {
	private int issueIdx;
	private String issueTitle;
	private String content;
	private Date startDate;
	private Date dueDate;
	private IssueProgress issueProgress;
	private String assigned;
	private String creator;
	private Priority priorityCode;
	private int labelIdx;
	private String file;
	private List<File> files;
	private HashMap<Integer, IssueLog> issueLogs;
	
	enum IssueProgress {
		REQUESTED,
		OPEN,
		CLOSED,
		REJECTED
	}
	
	enum Priority {
		LOW,
		MEDIUM,
		HIGH,
		URGENT
	}

	public int getIssueIdx() {
		return issueIdx;
	}

	public void setIssueIdx(int issueIdx) {
		this.issueIdx = issueIdx;
	}

	public String getIssueTitle() {
		return issueTitle;
	}

	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
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

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public IssueProgress getIssueProgress() {
		return issueProgress;
	}

	public void setIssueProgress(IssueProgress issueProgress) {
		this.issueProgress = issueProgress;
	}

	public String getAssigned() {
		return assigned;
	}

	public void setAssigned(String assigned) {
		this.assigned = assigned;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Priority getPriorityCode() {
		return priorityCode;
	}

	public void setPriorityCode(Priority priorityCode) {
		this.priorityCode = priorityCode;
	}

	public int getLabelIdx() {
		return labelIdx;
	}

	public void setLabelIdx(int labelIdx) {
		this.labelIdx = labelIdx;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	public HashMap<Integer, IssueLog> getIssueLogs() {
		return issueLogs;
	}

	public void setIssueLogs(HashMap<Integer, IssueLog> issueLogs) {
		this.issueLogs = issueLogs;
	}

	@Override
	public String toString() {
		return "Issue [issueIdx=" + issueIdx + ", issueTitle=" + issueTitle + ", content=" + content + ", startDate="
				+ startDate + ", dueDate=" + dueDate + ", issueProgress=" + issueProgress + ", assigned=" + assigned
				+ ", creator=" + creator + ", priorityCode=" + priorityCode + ", labelIdx=" + labelIdx + ", file="
				+ file + ", files=" + files + ", issueLogs=" + issueLogs + "]";
	}

	
	
}

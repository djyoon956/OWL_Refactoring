package com.owl.kanban.dto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.owl.notice.dto.File;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Issue {
	private int issueIdx;
	private String issueTitle;
	private String content;
	private Date startDate;
	private Date dueDate;
	private IssueProgressType issueProgress;
	private int projectIdx;
	private PriorityType priorityCode;
	private String assigned;
	private String creator;
	private int labelIdx;
	private int orderNum;
	private int colIdx;
	private List<File> files;
	private HashMap<Integer, IssueLog> issueLogs;
	
	public enum IssueProgressType {
		REQUESTED,
		OPEN,
		CLOSED,
		REJECTED
	}
	
	public enum PriorityType {
		LOW,
		MEDIUM,
		HIGH,
		URGENT
	}
	

}

package com.owl.kanban.dto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.owl.notice.dto.File;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Issue {
	private int projectIdx;
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
	private CommonsMultipartFile multipartFile;
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
}

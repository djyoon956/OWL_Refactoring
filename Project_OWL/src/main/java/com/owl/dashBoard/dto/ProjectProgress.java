package com.owl.dashBoard.dto;

import com.owl.kanban.dto.Issue.IssueProgressType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectProgress {
	private int projectIdx;
	private String projectName;
	private String assigned;
	private IssueProgressType issueProgress;
}

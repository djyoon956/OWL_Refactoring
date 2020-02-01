package com.owl.dashBoard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectMemberProgress {
	private int openCount;
	private int closeCount;
	private String assigned;
	private String assignedName;
}

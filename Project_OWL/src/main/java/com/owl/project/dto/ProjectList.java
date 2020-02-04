package com.owl.project.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectList {
	private int projectIdx;
	private String email;
	private int favorite;
	private String projectColor;
	private String authority;

	// UI용
	private String projectName;
	private String memberName;
	private Date startDate;
	private Date endDate;
}

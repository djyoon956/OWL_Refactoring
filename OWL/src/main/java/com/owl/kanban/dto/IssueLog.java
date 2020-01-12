package com.owl.kanban.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IssueLog {
	private int logIdx;
	private String log;
	private Date time;
}

package com.owl.kanban.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ColumnList {
	private int projectIdx;
	private String issueTitle;
	private int issueIdx;
	private String assigned;
	private String labelName;
	private String labelColor;
	private int colIdx;
	private String colname;
	private int orderNum;
}

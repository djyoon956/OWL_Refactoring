package com.owl.notice.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	private int noticeIdx;
	private String email;
	private String title;
	private String content;
	private Date writeDate;
	private List<File> files;
	private int readNum;
	
	public String  getWriteDate() {
		 return new SimpleDateFormat("yyyy-MM-dd").format(writeDate);
	}
}

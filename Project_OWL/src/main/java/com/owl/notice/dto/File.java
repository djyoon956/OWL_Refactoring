package com.owl.notice.dto;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class File {
	private FileType fileFrom;
	private int fileIdx;
	private int belongTo;
	private String writer;
	private String fileName;
	private String fileSize;

	public enum FileType {
		ISSUE
		, NOTICE
	}
}

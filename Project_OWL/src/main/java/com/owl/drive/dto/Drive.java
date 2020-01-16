package com.owl.drive.dto;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Drive {
	private int driveIdx; //파일식별번호
	private int projecIdx;
	private String folderName;
	private String fileName;
	private String creator;
	private Date startDate;
	private Date deleteDate;
	private int ref;
	private int depth;
	private boolean isDelete;
	private CommonsMultipartFile multipartFile;
}

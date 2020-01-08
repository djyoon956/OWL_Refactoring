package com.owl.project.dto;

import java.util.Date;
import java.util.List;

public class Board {

	private int boardIdx;
	private String userName;
	private String title;
	private String content;
	private int readNum;
	private Date writeDate;
	private List<File> files;
}

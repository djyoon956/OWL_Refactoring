package com.owl.calendar.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SmartCalendar {
	private int projectIdx;
	private int calIdx;
	private CalendarType type;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private String alarm;
	private String email;

	public enum CalendarType {
		MY, PROJECT
	}
	
	public String getstartDate() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(startDate);
	}
	
	public String getendDate() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(endDate);
	}
}

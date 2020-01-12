package com.owl.calendar.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pcalendar {
	private int calIdx;
	private CalendarType type;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private String alarm;
	private int projectIdx;
	
	
	enum CalendarType {
			P,
			PS
	}
}

package com.owl.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("Calendar.do")
	public String showview() {
		
		return "calendar/calendar";
	}
}

package com.owl.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.calendar.dto.SmartCalendar;
import com.owl.calendar.service.SmartCalendarService;

@Controller
public class SmartCalendarController {

	@Autowired
	private SmartCalendarService service;

	@RequestMapping("Calendar.do")
	public String showView() {
		return "calendar/calendar3";
	}
}

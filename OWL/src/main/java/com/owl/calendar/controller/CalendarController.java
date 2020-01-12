package com.owl.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.calendar.dto.Pcalendar;
import com.owl.calendar.service.PcalendarService;

@Controller
public class CalendarController {

	@Autowired
	private PcalendarService service;

	@RequestMapping("Calendar.do")
	public String showView() {
		return "calendar/calendar";
	}
}

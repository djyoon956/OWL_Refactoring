package com.owl.calendar.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.calendar.dto.SmartCalendar;
import com.owl.calendar.service.SmartCalendarService;

@RestController
public class SmartCalendarRestController {

	@Autowired
	SmartCalendarService service;
	
	@RequestMapping("insertCalendar.do")
	public boolean insertCalendar(SmartCalendar calendar, Principal principal) {
		boolean result = false;
		
		calendar.setType(calendar.getType());
		calendar.setTitle(calendar.getTitle());
		calendar.setContent(calendar.getContent());
		return result;
	}
}

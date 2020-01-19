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
	
	@RequestMapping(value="insertCalendar.do")
	public boolean insertCalendar(SmartCalendar calendar, Principal principal) {
		boolean result = false;
		calendar.setEmail(principal.getName());
		result = service.insertCalendar(calendar);
		System.out.println(result);
		return result;
	}

}

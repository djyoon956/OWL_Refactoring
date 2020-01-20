package com.owl.calendar.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.owl.calendar.dto.SmartCalendar;
import com.owl.calendar.dto.SmartCalendar.CalendarType;
import com.owl.calendar.service.SmartCalendarService;

@RestController
public class SmartCalendarRestController {

	@Autowired
	SmartCalendarService service;
	
	@RequestMapping(value="insertCalendar.do", method = RequestMethod.POST)
	public boolean insertCalendar(@RequestParam(value = "calendarId") int calendarId, 
												@RequestParam(value = "title") String title,
												@RequestParam(value = "location",required = false) String content,
												@RequestParam(value = "start") String startDate,
												@RequestParam(value = "end") String endDate,
												Principal principal) {
		boolean result = false;
		System.out.println("controller 입장");
		System.out.println(calendarId);
		SmartCalendar calendar = new SmartCalendar();
		try {
		
		if(calendarId == 0) {
			calendar.setType(CalendarType.MY);
		}else {
			calendar.setType(CalendarType.PROJECT);
			calendar.setProjectIdx(calendarId);
		}
		calendar.setTitle(title);
		calendar.setContent(content);		
		calendar.setStartDate(new SimpleDateFormat("yyyy-mm-dd HH:mm").parse(startDate));
		calendar.setEndDate(new SimpleDateFormat("yyyy-mm-dd HH:mm").parse(endDate));
		calendar.setEmail(principal.getName());
		System.out.println("insert 전 : " + calendar);
		result = service.insertCalendar(calendar);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println(result);
		return result;
	}

}

package com.owl.calendar.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
												@RequestParam(value = "allDay") boolean allDay,
												Principal principal) {
		boolean result = false;
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
		

		if(allDay) {			
			calendar.setStartDate(new SimpleDateFormat("yyyy-mm-dd").parse(startDate));
			calendar.setEndDate(new SimpleDateFormat("yyyy-mm-dd").parse(endDate));		
			calendar.setAllDay(1);
	
		}else {
			calendar.setStartDate(new SimpleDateFormat("yyyy-mm-dd HH:mm").parse(startDate));
			calendar.setEndDate(new SimpleDateFormat("yyyy-mm-dd HH:mm").parse(endDate));
			calendar.setAllDay(0);
		}		
		calendar.setEmail(principal.getName());
		result = service.insertCalendar(calendar);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value="deleteMyCalendar.do", method = RequestMethod.POST)
	public boolean deleteMyCalendar(Principal principal) {
		boolean result = false;
		result = service.deleteMyCalendar(principal.getName());	
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="deleteProjectCalendar.do", method = RequestMethod.POST)
	public boolean deleteProejctCalendar(@RequestParam(value = "calendarId") int projectIdx, Principal principal) {
		boolean result = false;
		System.out.println(projectIdx);
		result = service.deleteProjectCalendar(principal.getName(), projectIdx);
		System.out.println(result);
		return result;
	}
	
	
	@RequestMapping(value="getMyAllCalendars.do")
	public List<SmartCalendar> getMyAllCalendars(Principal principal){
		List<SmartCalendar> calendar = null;
		calendar = service.getMyAllCalendars(principal.getName());		
		System.out.println(calendar);
		return calendar;
	}
}

package com.owl.calendar.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	
	@RequestMapping(value="InsertCalendar.do", method = RequestMethod.POST)
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

	@RequestMapping(value="DeleteCalendar.do", method = RequestMethod.POST)
	public boolean deleteMyCalendar(@RequestParam(value = "calendarId") int projectIdx) {
		boolean result = false;
		result = service.deleteCalendar(projectIdx);	
		return result;
	}
	
	@RequestMapping(value="GetMyAllCalendars.do")
	public List<SmartCalendar> getMyAllCalendars(Principal principal){
		List<SmartCalendar> calendar = null;
		calendar = service.getMyAllCalendars(principal.getName());		
		return calendar;
	}
	
	@RequestMapping(value="UpdateCalendar.do", method = RequestMethod.POST)
	public boolean updateCalendar(@RequestParam(value = "scheduleId") int calIdx, 
												  @RequestParam(value = "calendarId" ,required = false) String projectIdx, 												  
												  @RequestParam(value = "title" ,required = false) String title,
												  @RequestParam(value = "location",required = false) String content,
												  @RequestParam(value = "start" ,required = false) String startDate,
												  @RequestParam(value = "end" ,required = false) String endDate,
												  @RequestParam(value = "allDay" ,required = false) boolean allDay,
												Principal principal) {
		boolean result = false;
		System.out.println("업데이트 캘린더 탐");
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(allDay);
		SmartCalendar calendar = new SmartCalendar();
		try {
		if(projectIdx !=null) { // 프로젝트 변경했을 때
			int chageIdx = Integer.parseInt(projectIdx);
			calendar.setProjectIdx(chageIdx);
			if(chageIdx == 0)
				calendar.setType(CalendarType.MY);
			else 
				calendar.setType(CalendarType.PROJECT);
		}else { // 프로젝트 변경 없을 때
			calendar.setProjectIdx(-1);
		}
			
		calendar.setTitle(title);
		calendar.setContent(content);	
		calendar.setCalIdx(calIdx);
		System.out.println(startDate);
		System.out.println("index : "+startDate.indexOf("GMT"));
		int inddex = startDate.indexOf("GMT");
	
		System.out.println(startDate.substring(0, inddex));
		System.out.println(startDate.substring(0, inddex+1));
		
		System.out.println(new SimpleDateFormat("E MMM dd yyyy HH:mm:ss").parse(startDate.substring(0, inddex-1)));
		System.out.println("-------------------------------");
			/*
			 * DateFormat dateFormat = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss ZZZZZ",
			 * Locale.KOREA);
			 */
		
			if(allDay) {
					calendar.setStartDate(new SimpleDateFormat("yyyy-mm-dd").parse(startDate));
					calendar.setEndDate(new SimpleDateFormat("yyyy-mm-dd").parse(endDate));		
					calendar.setAllDay(1);
			}else{
				if(!startDate.isEmpty()) {
					calendar.setStartDate(new SimpleDateFormat("EEE dd MMM yyyy HH:mm:ss z" ,Locale.KOREA).parse(startDate));
				}else if(!endDate.isEmpty()) {
					calendar.setEndDate(new SimpleDateFormat("EEE dd MMM yyyy HH:mm:ss z" ,Locale.KOREA).parse(endDate));		
				}
				calendar.setAllDay(0);
			}

		calendar.setEmail(principal.getName());
		result = service.updateCalendar(calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}

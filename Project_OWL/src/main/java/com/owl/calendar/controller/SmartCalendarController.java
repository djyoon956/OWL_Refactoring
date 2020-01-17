package com.owl.calendar.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.owl.calendar.dto.SmartCalendar;
import com.owl.calendar.dto.SmartCalendar.CalendarType;
import com.owl.calendar.service.SmartCalendarService;
import com.owl.project.dto.ProjectList;
import com.owl.project.service.ProjectService;

@Controller
public class SmartCalendarController {

	@Autowired
	private SmartCalendarService service;

	@Autowired
	private ProjectService projectService;

	@RequestMapping("Calendar.do")
	public String showView(Principal principal, Model model) {
		System.out.println("Calendar");
		List<ProjectList> projects = projectService.getProjectLists(principal.getName());
		System.out.println(projects);
		List<SmartCalendar> calendarDatas = service.getMemberCalendars(principal.getName());
		System.out.println(calendarDatas);
		Map<Integer, List<SmartCalendar>> datas = new HashMap<Integer, List<SmartCalendar>>();
		// Project Calendar
		projects.forEach(project -> {
			List<SmartCalendar> projectCalendars = calendarDatas.stream()
																					.filter(x->(x.getType() == CalendarType.PROJECT) && (x.getProjectIdx() == project.getProjectIdx()))
																					.collect(Collectors.toList());
			datas.put(project.getProjectIdx(), projectCalendars);
		});
		
		// My Calendar
		List<SmartCalendar>myCalendars = calendarDatas.stream()
																			.filter(calendar->calendar.getType() == CalendarType.MY)
																			.collect(Collectors.toList());
		
		model.addAttribute("project", datas);
		model.addAttribute("projectCalendars", datas);
		model.addAttribute("myCalendars", myCalendars);
		return "calendar/calendar3";
	}
}

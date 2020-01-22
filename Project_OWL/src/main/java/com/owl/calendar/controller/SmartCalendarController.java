package com.owl.calendar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<ProjectList> projects = projectService.getProjectLists(principal.getName());
		model.addAttribute("projectList", projects);
		return "calendar/calendar";
	}
	
	
}

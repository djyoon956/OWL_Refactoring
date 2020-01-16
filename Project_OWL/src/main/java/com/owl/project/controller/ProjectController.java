package com.owl.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.project.dto.ProjectList;
import com.owl.project.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;

	@RequestMapping("Project.do")
	public String showProject(int projectIdx, Principal	principal, Model model) {
		System.out.println("showProject : " + projectIdx);
		
		List<ProjectList> projectList  = null;
		projectList = service.getProjectLists(principal.getName());
		model.addAttribute("projectList", projectList);
		return "project/projectMain";
	}
}

package com.owl.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {

	@RequestMapping("Project.do")
	public String showProject(int projectIdx) {
		System.out.println("showProject : " + projectIdx);
		return "project/projectMain";
	}
}

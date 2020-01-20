package com.owl.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		ProjectList project = projectList.stream().filter(x -> x.getProjectIdx() == projectIdx).findFirst().get();
		System.out.println(project);
		model.addAttribute("project", project);
		return "project/projectMain";
	}

	@RequestMapping(value = "AddProjectMemberOk.do", method = RequestMethod.POST)
	public String addProjectMemberOk(int joinProjectIdx, String projectName, String joinProjectPm, HttpServletRequest request, Model model) {
		model.addAttribute("projectName", projectName);
		request.getSession().setAttribute("joinProjectIdx", joinProjectIdx);
		request.getSession().setAttribute("joinProjectPm", joinProjectPm);

		return "member/joinProject";
	}
}

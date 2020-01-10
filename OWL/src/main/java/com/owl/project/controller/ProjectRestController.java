package com.owl.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.project.dto.ProjectList;
import com.owl.project.service.ProjectService;

@RestController
public class ProjectRestController {

	@Autowired
	private ProjectService service;
	
	
	@RequestMapping("EditMyProject.do")
	public String updateProjectList(ProjectList projectlist, HttpServletRequest request, Model model) {
		
		ProjectList projectList = null;
		try {
			projectlist.setFavorite(projectlist.getFavorite());
			projectlist.setProjectColor(projectlist.getProjectColor());
			service.updateProjectList(projectlist);						

			model.addAttribute("projectlist", projectlist);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ;
	}
}

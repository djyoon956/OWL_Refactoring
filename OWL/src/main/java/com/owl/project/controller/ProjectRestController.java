package com.owl.project.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.owl.project.dto.Project;
import com.owl.project.dto.ProjectList;
import com.owl.project.service.ProjectService;

@RestController
public class ProjectRestController {

	@Autowired
	private ProjectService service;
	
	@RequestMapping("EditMyProject.do")
	public  boolean updateProjectList(String projectIdx, String favorite, String projectColor, ProjectList projectlist, Principal principal) {
		boolean result = false;
		try {
			projectlist.setEmail(principal.getName());
			projectlist.setProjectIdx(projectlist.getProjectIdx());
			projectlist.setFavorite(projectlist.getFavorite());
			projectlist.setProjectColor(projectlist.getProjectColor());
			result = service.updateProjectList(projectlist);						

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("InsertNewProject.do")
	public boolean insertNewProject(Project project, ProjectList projectlist, Principal principal, HttpServletRequest request) throws Exception {
		boolean result = false;
		try {
	//	result = service.insertNewProject(project, projectlist);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}
}

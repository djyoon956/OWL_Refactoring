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
	
	//Sidebar의 프로젝트 목록 수정
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
	
	//새 프로젝트 추가
	@RequestMapping("InsertNewProject.do")
	public boolean insertNewProject(String projectName, String projectColor, Project project, ProjectList projectlist, Principal principal, HttpServletRequest request) throws Exception {
		boolean result = false;
		try {
		projectlist.setEmail(principal.getName());
		System.out.println(principal.getName());
		project.setProjectName(project.getProjectName());		
		projectlist.setProjectColor(projectlist.getProjectColor());
		result = service.insertNewProject(project, projectlist);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}
}

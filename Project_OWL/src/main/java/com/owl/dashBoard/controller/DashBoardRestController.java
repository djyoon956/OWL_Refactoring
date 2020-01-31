package com.owl.dashBoard.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.dashBoard.service.DashBoardService;

@RestController
public class DashBoardRestController {
	
	@Autowired
	private DashBoardService service;
	
	@RequestMapping("GetMyIssueTask.do")
	public void getMyIssueTasks(Principal principal) {
		System.out.println("in getMyIssueTasks");
		service.getMyIssueTasks(principal.getName());
	}
}

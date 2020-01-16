package com.owl.kanban.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.owl.kanban.dto.Issue;
import com.owl.kanban.service.KanbanService;

@Controller
public class KanbanController {
	
	@Autowired
	private KanbanService service;


	
	
	
}

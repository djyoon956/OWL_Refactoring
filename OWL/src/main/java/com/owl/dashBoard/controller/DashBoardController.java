package com.owl.dashBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashBoardController {
	@RequestMapping("MyDashboard.do")
	public String showview() {
		return "dashboard/myDashboard";
	}
}

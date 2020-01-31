package com.owl.dashBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashBoardController {
	/**
	 * My DashBoard 페이지 요청
	 * @author 이정은
	 * @since 2020/01/29
	 * @return String
	 */
	@RequestMapping("MyDashboard.do")
	public String showview() {
		return "dashboard/myDashboard";
	}
}

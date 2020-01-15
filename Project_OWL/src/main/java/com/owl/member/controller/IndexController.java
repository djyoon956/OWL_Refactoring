package com.owl.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("Index.do")
	public String showview() {
		return "index2";
	}
	
	@RequestMapping("Main2.do")
	public String showview2() {
		return "member/main";
	}
}

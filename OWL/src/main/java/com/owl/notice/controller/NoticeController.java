package com.owl.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("Notice.do")
	public String showview() {
		return "notice/notice";
	}
}

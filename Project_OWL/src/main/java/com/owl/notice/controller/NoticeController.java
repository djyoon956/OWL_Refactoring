package com.owl.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.owl.notice.dto.Notice;

@Controller
public class NoticeController {

	@RequestMapping("Notice.do")
	public String showview() {
		return "notice/notice";
	}
	@RequestMapping("NoticeWrite.do")
	public String write() {
		return "notice/noticeWrite";
	}
}

package com.owl.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.owl.member.service.MemberService;

@RestController
public class DbTestController {
	@Autowired
	private MemberService Service;

	// ******************************************************
	// DB TEST 용입니다.
	// 삭제 예정
	// ******************************************************
	@RequestMapping(value = "TEST.do", method = RequestMethod.GET)
	public boolean dbTest() {
		Service.test();
		return Service.test();
	}
}

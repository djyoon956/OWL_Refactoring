package com.owl.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.chat.dto.MyProjectsMates;
import com.owl.chat.service.ChatService;


@RestController
public class ChatRestController {
	
	@Autowired
	private ChatService service;
	
	
	
	@RequestMapping("MyProjectsMates.do")
	public List<MyProjectsMates> getMyProjectsMates(String email, String name) {
		System.out.println("마이 프로젝트 마이츠 보기 함수 초입 타나요??.");
		System.out.println("뷰단에서 들어온 데이타 확인" + email+ " / " + name);
		List<MyProjectsMates> result = new ArrayList<MyProjectsMates>();
		
		try {
			result = service.getMyProjectsMates("aaa@gmail.com", "윤다정");
			System.out.println("마이프로젝트마이츠 컨트롤러 트라이 안 : " + result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
}

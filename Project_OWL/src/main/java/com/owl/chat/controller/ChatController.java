package com.owl.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.chat.dto.MyProjectsMates;
import com.owl.chat.service.ChatService;


@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "chatTest.do")
	public String emailConfirmOK() {
		
		return "chat/newChat2";
	}
	
	
	
}

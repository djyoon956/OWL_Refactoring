package com.owl.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.owl.chat.service.ChatService;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
}

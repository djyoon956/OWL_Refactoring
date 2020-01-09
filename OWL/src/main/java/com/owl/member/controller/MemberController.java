package com.owl.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.owl.member.dto.Member;
import com.owl.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
		//회원정보 조회
		@RequestMapping("/GetMember.do")
		public String GetMember(String email, Model model) throws Exception{
		try {	
			//회원정보
			Member member = service.getMember("qqq@gmail.com");
			System.out.println("멤버 조회 : " + member);
			model.addAttribute("member", member);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "include/modal/myProfileSetting";
		}

}

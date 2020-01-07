package com.owl.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.owl.member.dto.Member;

@RestController
public class MemberRestController {
	
	@RequestMapping(value = "/FindPassword.do")
	public Map<String, Object> findPassword(String email) throws Exception {
		System.out.println("in FindPassword");
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isMember = false;
		String message = "";

		isMember = true;

		// 회원 경우
		if (isMember) {
			isMember = true;
			message = "이메일을 전송했습니다."
						+ "\n이메일을 확인해주세요.";
		}
		// 비회원 경우
		else {
			message = "존재하지 않는 이메일입니다.";
		}

		map.put("result", isMember);
		map.put("message", message);

		return map;
	}
}

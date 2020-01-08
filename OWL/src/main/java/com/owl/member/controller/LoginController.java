package com.owl.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactory;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.owl.member.dto.Member;
import com.owl.member.service.KaKaoService;
import com.owl.member.service.NaverService;

@Controller
public class LoginController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	@Autowired
	private KaKaoService kaKaoService;

	@Autowired
	private NaverService naverService;

	@RequestMapping(value = "Login.do", method = RequestMethod.GET)
	public String showView() {
		return "member/newlogin";
	}

	@RequestMapping(value = "Login.do", method = RequestMethod.POST)
	public String login() {

		System.out.println("login");
		return "member/main";
	}

	@RequestMapping(value = "kakaoLogin.do", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
		System.out.println("kakaoLoign");
		System.out.println(naverService.getAuthorizationUrl(session));
		String accessToken = kaKaoService.getAccessToken(code);
		Member member = kaKaoService.getUserInfo(accessToken);

		// id 체크 후 db에 없으면 insert

		session.setAttribute("memberName", member.getName());
		return "member/main";
	}

	// kakaoLoginCallback.do
	@RequestMapping("naverLogin.do")
	public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, Model model)
			throws IOException {
		System.out.println("naverLogin");
		System.out.println("naverLogin : " + code);
		System.out.println("naverLogin : " + state);
		OAuth2AccessToken oauthToken;
		oauthToken = naverService.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		String apiResult = naverService.getUserProfile(oauthToken);
		System.out.println("apiResult" + apiResult);
		model.addAttribute("result", apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "member/main";
	}

	@RequestMapping("googleLogin.do")
	public String googleLogin() {
		System.out.println("googleLogin");
		
		return "member/main";
	}
	
	@RequestMapping("Lock.do")
	public String showLockView() {
		return "member/lock";
	}
 
	@RequestMapping(value = "EmailConfirm.do", method = RequestMethod.POST)
	public String emailConfirm(Member member, Model model) {
		System.out.println(member.toString());
		try {
			// DB insert 해야함
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			Map<String, Object> models = new HashMap<String, Object>();
			models.put("memberId", member.getEmail());
			models.put("name", member.getName());
			
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "joinTemplate.vm", "UTF-8", models);
			messageHelper.setSubject("[OWL] 가입을 환영합니다.");
			messageHelper.setFrom("bit_team2@naver.com");
			messageHelper.setTo(member.getEmail());
			messageHelper.setText(mailBody, true);
			mailSender.send(message);

		} catch (Exception e) {
			System.out.println("이거 에러..>" + e.getMessage());
		}
		
		model.addAttribute("mail", member.getEmail());
		model.addAttribute("show", "joinEmail");
		
		return "index";
	}
	
	@RequestMapping(value = "EmailConfirm.do", method = RequestMethod.GET)
	public String emailConfirmOK(String memberId, Model model) {
		model.addAttribute("show", "joinOk");
		model.addAttribute("memberId", memberId);
		return "index";
	}
}

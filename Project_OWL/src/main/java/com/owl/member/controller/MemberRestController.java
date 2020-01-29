package com.owl.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.owl.member.dto.Member;
import com.owl.member.dto.Setting;
import com.owl.member.service.MemberService;
import com.owl.project.service.ProjectService;

@RestController
public class MemberRestController {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	@Autowired
	private MemberService service;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "ForgotPassword.do")
	public Map<String, Object> findPassword(String email) throws Exception {
		System.out.println("ForgotPassword");
		System.out.println(email);
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isMember = false;
		String message = "";
		isMember = true;

		// 회원 경우
		if (isMember) {
			isMember = true;
			try {
				MimeMessage content = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(content, true, "UTF-8");
				Map<String, Object> models = new HashMap<String, Object>();
				models.put("memberId", email);

				String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngineFactoryBean.createVelocityEngine(), "forgotPasswordTemplate.vm", "UTF-8", models);
				messageHelper.setSubject("[OWL] 비밀번호 재설정");
				messageHelper.setFrom("bit4owl@gmail.com");
				messageHelper.setTo(email);
				messageHelper.setText(mailBody, true);
				mailSender.send(content);
				message = "이메일을 전송했습니다." + "\n이메일을 확인해주세요.";
			} catch (Exception e) {
				System.out.println("이거 에러..>" + e.getMessage());
			}
		}
		// 비회원 경우
		else {
			message = "존재하지 않는 이메일입니다.";
		}

		map.put("result", isMember);
		map.put("message", message);

		return map;
	}


	// 비밀번호 확인
	@RequestMapping("chkDelPwd.do")
	public boolean chkDelPWd(String email, String password) throws Exception {
		System.out.println("email : " + email + " / password :" + password);
		Member member = service.getMember(email);
		String encodedPassword = member.getPassword();
		boolean result = bCryptPasswordEncoder.matches(password, encodedPassword);

		return result;
	}

	@RequestMapping("Emailcheck.do")
	public String emailCheck(String email, Model model) throws Exception {
		System.out.println("EmailCheck controller in");
		boolean result = service.emailCheck(email);

		String data = "";
		if (result) {
			System.out.println("we have already this email");
			data = "false";

		} else {
			System.out.println("you can use this email");
			data = "true";
		}

		model.addAttribute("data", data);
		return data;
	}

	@RequestMapping(value = "ResetPassword.do", method = RequestMethod.POST)
	public boolean resetPassword(String email, String password) {
		password = bCryptPasswordEncoder.encode(password);
		boolean result = service.changePassword(email, password);
		System.out.println("ResetPassword post");
		System.out.println(result);
		return result;
	}

	@RequestMapping("PageChage.do")
	public ModelAndView test(String page, String projectIdx, Principal principal) {
		String view = "";
		ModelAndView mv = new ModelAndView();

		if (page.startsWith("dash"))
			view = "dashBoard/dashBoard";
		else if (page.startsWith("calendar"))
			view = "calendar/calendar2";
		else if (page.startsWith("project")) {
			view = "project/main";
			mv.addObject("project", projectService.getProjectList(Integer.parseInt(projectIdx), principal.getName()));
		}

		mv.setViewName(view);

		return mv;
	}

	@RequestMapping("SettingChange.do")
	public Setting settingChange(String cmd, String value, HttpServletRequest request, Principal principal) {
		System.out.println(value);
		if(value.equals("rgb(128, 128, 128)"))
			value = "black";
		boolean result = service.updateSetting(principal.getName(), cmd.toUpperCase(), value);
		Setting setting = null;
		if (result) {
			setting = service.getSetting(principal.getName());
			request.getSession().setAttribute("setting", service.getSetting(principal.getName()));
		}

		return setting;
	}
}

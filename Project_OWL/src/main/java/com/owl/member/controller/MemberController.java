package com.owl.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.owl.helper.UploadHelper;
import com.owl.member.dto.Member;
import com.owl.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "EmailConfirm.do", method = RequestMethod.POST)
	public String emailConfirm(Member member, Model model, HttpServletRequest request) {
		String imagefilename = member.getMultipartFile().getOriginalFilename();
		boolean result = false;
		System.out.println("durl");
		System.out.println(imagefilename);
		try {
			if (!imagefilename.equals("")) { // 실 파일 업로드
				String uploadpath = request.getServletContext().getRealPath("upload");
				String filePath = UploadHelper.uploadFile(uploadpath,"member", imagefilename, member.getMultipartFile().getBytes());
				member.setProfilePic(filePath);
			}

			member.setPassword(bCryptPasswordEncoder.encode(member.getPassword())); // 비밀번호 암호화
			result = service.insertMember(member);

			if (result) {
				System.out.println("여기는 true");
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				Map<String, Object> models = new HashMap<String, Object>();
				models.put("memberId", member.getEmail());
				models.put("name", member.getName());

				String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngineFactoryBean.createVelocityEngine(), "joinTemplate.vm", "UTF-8", models);
				messageHelper.setSubject("[OWL] 가입을 환영합니다.");
				messageHelper.setFrom("bit4owl@gmail.com");
				messageHelper.setTo(member.getEmail());
				messageHelper.setText(mailBody, true);
				mailSender.send(message);

				model.addAttribute("mail", member.getEmail());
				model.addAttribute("show", "joinEmail");

				// viewpage="redirect:Login.do";

			} else {
				System.out.println("여기는 else");
				model.addAttribute("show", "join");

				// viewpage="redirect:Login.do";
			}
		} catch (Exception e) {
			System.out.println("이거 에러..>" + e.getMessage());
			model.addAttribute("show", "join");

		}

		// model.addAttribute("show", "joinEmail");
		return "member/login";
	}

	@RequestMapping(value = "EmailConfirmOk.do")
	public String emailConfirmOK(String memberId, Model model) {
		System.out.println("EmailConfirmOk.do");
		System.out.println(memberId);
		service.joinMemberOk(memberId);

		model.addAttribute("show", "joinOk");
		model.addAttribute("memberId", memberId);
		return "index";
	}

	@RequestMapping(value = "UpdateMember.do")
	public String UpdateMember(Member member, HttpServletRequest request, Model model) {
		try {
			String imagefilename = member.getMultipartFile().getOriginalFilename();

			if (!imagefilename.equals("")) { // 실 파일 업로드
				String uploadpath = request.getServletContext().getRealPath("upload");
				String filePath = UploadHelper.uploadFile(uploadpath,"member", imagefilename, member.getMultipartFile().getBytes());
				member.setProfilePic(filePath);
			}

			member.setName(member.getName());
			member.setPassword(member.getPassword());

			service.updateMember(member);
			model.addAttribute("member", member);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/main";
	}

	@RequestMapping(value = "DeleteAccount.do")
	public String deleteMember(String email, Model model) {
		// 테스트 데이터
		boolean result = service.deleteMember(email);
		String view = "";
		if (result) {
			view = "member/deleteOk";
		} else {
			view = "include/modal/myProfileSetting";
		}
		return view;
	}

	@RequestMapping(value = "ResetPassword.do", method = RequestMethod.GET)
	public String showResetPasswordView(String memberId, Model model) {
		System.out.println("ResetPassword");
		model.addAttribute("email", memberId);
		return "member/deleteOk2";
	}
}

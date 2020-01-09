package com.owl.member.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.owl.member.dto.Member;
import com.owl.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;


	
	
	@RequestMapping(value="UpdateMember.do")
	public String UpdateMember(Member member, HttpServletRequest request,  Model model) {
		try {
			String imagefilename = member.getMultipartFile().getOriginalFilename();
			
			if (!imagefilename.equals("")) { // 실 파일 업로드
				String uploadpath = request.getServletContext().getRealPath("upload");
				checkDirectory(uploadpath);
				System.out.println(uploadpath);
				String fpath = uploadpath + "\\" + imagefilename;

				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(member.getMultipartFile().getBytes());
				fs.close();
				member.setProfilePic(imagefilename);
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
	
	private void checkDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdir();
	}
	@RequestMapping(value= "DeleteAccount.do", method = RequestMethod.GET)
	public String deleteMember() {
		
		return "member/deleteOk";
	}
}

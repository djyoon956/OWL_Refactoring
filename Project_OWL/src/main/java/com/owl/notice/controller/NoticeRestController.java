package com.owl.notice.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.File;
import com.owl.notice.dto.Notice;
import com.owl.notice.service.NoticeService;

@RestController
public class NoticeRestController {
	@Autowired
	private NoticeService service;

	@RequestMapping(value = "GetNotices.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Notice> getNotices(int projectIdx) {
		System.out.println("getNotices : "+projectIdx);
		List<Notice> notices = service.getNoticesByProjectIdx(projectIdx);

		return notices;
	}


	@RequestMapping(value = "WriteNotice.do", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public boolean insertNotice(@RequestParam(value = "projectIdx") int projectIdx
			, @RequestParam(value = "content") String content
			, @RequestParam(value = "title") String title
			, @RequestParam(value = "multipartFiles", required = false) List<MultipartFile> multipartFiles
			, Principal principal) {
		System.out.println("insertNotice");
		System.out.println(projectIdx);
		System.out.println(content);
		System.out.println(title);
		System.out.println(multipartFiles.size());
		
		Notice notice = new Notice();
		notice.setProjectIdx(projectIdx);
		notice.setContent(content);
		notice.setTitle(title);
		notice.setEmail(principal.getName());
		List<File> files = new ArrayList<File>();
		// multipartFiles insert
		notice.setFiles(files);

		boolean result= false;
		try {
			result = service.insertNotice(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}
}

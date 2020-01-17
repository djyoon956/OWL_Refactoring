package com.owl.kanban.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.owl.kanban.dto.Issue;
import com.owl.kanban.service.KanbanService;
import com.owl.member.dto.Member;
import com.owl.member.service.MemberService;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;

@RestController
public class KanbanRestController {
	@Autowired
	private SqlSession sqlSession;

	
	@Autowired
	private KanbanService service;
	
	
	@RequestMapping("GetKanban.do")
	public List<Notice> getNotices(int projectIdx) {
		System.out.println("getNotices : " + projectIdx);
		NoticeDao dao = getNoticeDao();
		List<Notice> notices = null;
		try {
			notices = dao.getNoticesByProjectIdx(projectIdx);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return notices;
	}

	


	@RequestMapping(value="InsertIssue.do", method = RequestMethod.POST, consumes = { "multipart/form-data" })     
	public boolean insertIssue(@RequestParam(value = "projectIdx") int projectIdx
			, @RequestParam(value = "issueTitle") String issueTitle
			, @RequestParam(value = "content") String content
			, @RequestParam(value = "assigned", required = false) String assigned
			, @RequestParam(value = "labelIdx", required = false) int labelIdx
			, @RequestParam(value = "dueDate", required = false) Date dueDate
			, @RequestParam(value = "multipartFiles", required = false) List<MultipartFile> multipartFiles
			, Principal principal) {
		System.out.println("insert insertIssue in");
		System.out.println("content : " + content);
		System.out.println("assigned : " + assigned);
		System.out.println("labelIdx : " + labelIdx);
		System.out.println("dueDate : " + dueDate);
		System.out.println("multipartFiles : " + multipartFiles.size());

				return false;
		
	}
	
	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
}

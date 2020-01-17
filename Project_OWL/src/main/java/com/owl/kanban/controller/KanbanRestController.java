package com.owl.kanban.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.kanban.dto.Issue.Priority;
import com.owl.kanban.service.KanbanService;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.File;
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

	@RequestMapping("InsertColumn.do")
	public int insertColumn(Column column, Model model) {
		//System.out.println("insertColumn function in");
		//System.out.println("column : " + column);
		//System.out.println(column.getProjectIdx() + "/" + column.getColname());

		Column col = new Column();
		col.setProjectIdx(column.getProjectIdx());
		col.setColname(column.getColname());
		
		boolean result = false;

		
		result = service.insertColumn(col); 
		
		int data = -1;
		
		if(result) {
			data = col.getColumnIdx();
		};
		
		//System.out.println("컨트롤러 result : " + result);
		//System.out.println("여기도찍히나? " + col.getColumnIdx());
	
		return data;
	}

	
	
	@RequestMapping(value="InsertIssue.do", method = RequestMethod.POST, consumes = { "multipart/form-data" })     
	public boolean insertIssue(@RequestParam(value = "projectIdx") int projectIdx
							, @RequestParam(value = "issueTitle") String issueTitle
							, @RequestParam(value = "content") String content
							, @RequestParam(value = "priorityCode", required = false) Priority priorityCode
							, @RequestParam(value = "assigned", required = false) String assigned
							, @RequestParam(value = "labelIdx", required = false) int labelIdx
							, @RequestParam(value = "dueDate", required = false) Date dueDate
							, @RequestParam(value = "multipartFiles", required = false) List<MultipartFile> multipartFiles
							, Principal principal, HttpServletRequest request) {	
		
		//System.out.println("insertIssue controller in");
		//System.out.println(projectIdx);
		//System.out.println(issueTitle);
		//System.out.println(content);
		//System.out.println(assigned);
		//System.out.println(labelIdx);
		//System.out.println(dueDate);
		//System.out.println(priorityCode);
		//System.out.println(multipartFiles);
		//System.out.println(multipartFiles.size());

		Issue issue = new Issue();
		issue.setProjectIdx(projectIdx);
		issue.setIssueTitle(issueTitle);
		issue.setContent(content);
		issue.setPriorityCode(priorityCode);
		issue.setAssigned(assigned);
		issue.setLabelIdx(labelIdx);
		issue.setDueDate(dueDate);
		issue.setCreator(principal.getName());
		
		System.out.println("principal.getName() :"  + principal.getName());

		//System.out.println(issue.toString());
		//issue.setFiles(multipartFiles);
		boolean result = false;
		result = service.insertIssue(issue, multipartFiles, request.getServletContext().getRealPath("upload"));

		
		return result;
		
	}
	
	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
	

}

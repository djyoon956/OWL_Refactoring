package com.owl.kanban.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.owl.helper.UploadHelper;
import com.owl.kanban.dao.KanbanDao;
import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.File;
import com.owl.notice.dto.File.FileType;
import com.owl.project.dto.Label;

@Service
public class KanbanService {
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public boolean insertIssue(Issue issue, List<MultipartFile> multipartFiles, String uploadPath) {
		System.out.println("insertIssue service in");
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		try {
			result = dao.insertIssue(issue) > 0 ? true : false;
			System.out.println(multipartFiles.size());
			if (multipartFiles.size() > 0) 
				issue.setFiles(insertIssueFiles(dao, issue.getCreator(), issue.getProjectIdx(), issue.getIssueIdx(), multipartFiles, uploadPath));

		} catch (Exception e) {
			System.out.println("Trans 예외 발생 : " + e.getMessage());
		} 
		
		
		return result;
	}

		
	
	private List<File> insertIssueFiles(KanbanDao dao, String email, int projectIdx, int issueIdx, List<MultipartFile> multipartFiles, String uploadPath) {
		List<File> files = new ArrayList<File>();

		multipartFiles.forEach(multipartFile -> {
			String fileName = multipartFile.getOriginalFilename();
			System.out.println(fileName);
			try {
				UploadHelper.uploadFileByProject(uploadPath, "file", projectIdx, fileName, multipartFile.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}

			File file = new File();
			file.setFileFrom(FileType.ISSUE);
			file.setBelongTo(issueIdx);
			file.setFileName(fileName);
			file.setWriter(email);
			file.setFileSize(String.valueOf(multipartFile.getSize()));
			
			try {
				dao.insertIssueFile(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			files.add(file);
		});

		return files;
	}


	public boolean insertColumn(Column column) {
		System.out.println("insertColumn Service in");
		System.out.println(column.getProjectIdx() + "/" + column.getColname());
		
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		try {
			
			result = dao.insertColumn(column) > 0 ? true : false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("insert service 결과 : " + result);
		System.out.println("insert service 컬럼 아이디엑스  : " + column.getColumnIdx());
		
		return result;
	}
	
	
	
	public boolean insertLabel(Label label) {
		System.out.println("insertLabel Service in");
		System.out.println(label.getProjectIdx() + "/" + label.getLabelColor());
		
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		try {
			
			result = dao.insertLabel(label) > 0 ? true : false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("insert service 결과 : " + result);
		System.out.println("insert service 컬럼 아이디엑스  : " + label.getLabelIdx());
		
		return result;
	}
	
	
	
	
	
	public List<Member>getAssignees(int projectIdx) {
		KanbanDao dao = getKanbanDao();
		Member member = null;
		
		try {
			member = dao.selectProjectMember(projectIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return null;
	}
	
	
	
	private KanbanDao getKanbanDao() {
		return sqlSession.getMapper(KanbanDao.class);
	}
}

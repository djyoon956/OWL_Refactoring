package com.owl.notice.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.owl.helper.UploadHelper;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.File;
import com.owl.notice.dto.Notice;
import com.owl.notice.dto.File.FileType;


@Service
public class NoticeService {
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public boolean insertNotice(Notice notice, List<MultipartFile> multipartFiles, String uploadPath) throws Exception{
		NoticeDao dao = getNoticeDao();
		boolean result = false;
		System.out.println(notice.getEmail());
		try {
			result = dao.insertNotice(notice) > 0 ? true : false;

			System.out.println(multipartFiles.size());
			if (multipartFiles.size() > 0) 
				notice.setFiles(insertNoticeFiles(dao, notice.getEmail(),notice.getProjectIdx(),notice.getBoardIdx(), multipartFiles, uploadPath));

		} catch (Exception e) {
			System.out.println("Trans 예외 발생 : " + e.getMessage());
			throw e; 
		}

		return result;
	}
	
	private List<File> insertNoticeFiles(NoticeDao dao, String email, int pojectIdx, int boardIdx, List<MultipartFile> multipartFiles, String uploadPath) {
		List<File> files = new ArrayList<File>();

		multipartFiles.forEach(multipartFile -> {
			String fileName = multipartFile.getOriginalFilename();
			System.out.println(fileName);
			try {
				UploadHelper.uploadFileByProject(uploadPath, "file", pojectIdx, fileName, multipartFile.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}

			File file = new File();
			file.setFileFrom(FileType.NOTICE);
			file.setBelongTo(boardIdx);
			file.setFileName(fileName);
			file.setWriter(email);
			file.setFileSize(String.valueOf(multipartFile.getSize()));
			
			try {
				dao.insertNoticeFile(file);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			files.add(file);
		});

		return files;
	}

	public List<Notice> getNoticesByProjectIdx(int projectIdx) {
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

	public Notice getNotice(int boardIdx) {
		NoticeDao dao = getNoticeDao();
		Notice notice = new Notice();
		try {
			notice = dao.getNotice(boardIdx);
			notice.setFiles(dao.getNoticeFiles(FileType.NOTICE, boardIdx));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return notice;
	}

	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
}

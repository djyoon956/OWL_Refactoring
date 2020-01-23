package com.owl.kanban.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.owl.helper.UploadHelper;
import com.owl.kanban.dao.KanbanDao;
import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.member.dto.Member;
import com.owl.notice.dto.File;
import com.owl.project.dao.ProjectDao;
import com.owl.project.dto.Label;

@Service
public class KanbanService {
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	public Issue insertIssue(Issue issue, List<MultipartFile> multipartFiles, String uploadPath) {
		System.out.println("insertIssue service in");
		System.out.println(issue.getDueDate());
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		Issue colList = null;
		try {
		
			result = dao.insertIssue(issue) > 0 ? true : false;
			//System.out.println(multipartFiles.size());
			
			if (multipartFiles.size() > 0) 
				issue.setFiles(insertIssueFiles(dao, issue.getCreator(), issue.getProjectIdx(), issue.getIssueIdx(), multipartFiles, uploadPath));
			
			//System.out.println("???????" +issue.getIssueIdx()  +"/" +issue.getProjectIdx());
			
			dao.updateAllIncrease(issue.getIssueIdx(), issue.getProjectIdx());
			//System.out.println("issue idx 뭐니?" + issue.getIssueIdx());

			//System.out.println("service : " +issue.getProjectIdx() + " /"  + issue.getIssueIdx());
			if(result) {
				colList = dao.getIssuebyIssueIdx(issue.getProjectIdx(), issue.getIssueIdx());
			}
		} catch (Exception e) {
			System.out.println("Trans 예외 발생 : " + e.getMessage());
		} 
		
		System.out.println("service colist : " + colList);
		
		return colList;
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
			file.setIssueIdx(issueIdx);
			file.setFileName(fileName);
			file.setWriter(email);
			file.setFileSize(String.valueOf(multipartFile.getSize()/1024));
			System.out.println("file값" +file.toString());
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
		
		System.out.println("컬럼정보" + column.toString());
		System.out.println("insert service 결과 : " + result);
		System.out.println("insert service 컬럼 아이디엑스  : " + column.getColIdx());
		
		
		return result;
	}
	
	
	
	public boolean insertLabel(Label label) {
		System.out.println("insertLabel Service in");
		System.out.println(label.getProjectIdx() + "/" + label.getLabelColor() + label.getLabelName());
		
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
	
	
	
	public List<Label> getLabelList(int projectIdx) {
		System.out.println("getLabelList : " + projectIdx);
		KanbanDao dao = getKanbanDao();
		List<Label> lblist = null;
		
		try {
			lblist = dao.getLabelList(projectIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("lblist뭐니?"   + lblist);
		return lblist;
	}
	
	
	public List<Column> getColum(int projectIdx){
		KanbanDao dao = getKanbanDao();
		List<Column> colList = null;
		try {
			colList = dao.getColumn(projectIdx);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return colList;
	}
	
	public List<Issue> getIssue(int projectIdx){
		KanbanDao dao = getKanbanDao();
		List<Issue> issue = null;
		
		try {
			issue = dao.getIssue(projectIdx);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return issue;
	}
	
	public boolean updateColumn(Column column) {
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		try {
			System.out.println("칼럼 업데이트  :" + column);
			result = dao.updateColumn(column) > 0 ? true : false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	public boolean deleteColumn(int colIdx) {
		boolean result = false;
		KanbanDao dao = getKanbanDao();
		try {
			result = dao.deleteColumn(colIdx) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public boolean deleteIssue(int issueIdx) {
		boolean result = false;
		KanbanDao dao = getKanbanDao();
		try {
			result = dao.deleteIssue(issueIdx) > 0 ? true : false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public boolean deleteLabel(int labelIdx) {
		System.out.println("deleteLabel service in++++++++++++");
		System.out.println("labelIdx" +labelIdx);
		boolean result = false;
		KanbanDao dao = getKanbanDao();
		try {
			result = dao.deleteLabel(labelIdx) > 0 ? true : false;
			System.out.println("result" + result);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	};
	

	public Map<String, Object> getIssueform(int projectIdx) {
		System.out.println("getIssueform in");
		
		Map<String, Object> object = new HashMap<>();
		KanbanDao daok = getKanbanDao();
		ProjectDao daop = getProjectDao();
		
		try {
			List<Label> label = daok.getLabelList(projectIdx);
			List<Member> member = daop.getProjectMembers(projectIdx);
			
			object.put("label", label);
			object.put("member", member);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		//System.out.println("object" + object);
		
		return object;
	}
	

	public boolean updateIssueOrder() {
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		
		return result;
	}

	
	public Issue getIssueDetail(int projectIdx, int issueIdx) {
		KanbanDao dao = getKanbanDao();
		Issue issue = null;

		try {
			issue = dao.getIssuebyIssueIdx(projectIdx, issueIdx);
			issue.setFiles(dao.getIssueFiles(issueIdx));
			issue.setLogs(dao.getIssueLogs(issueIdx));
			issue.setReplies(dao.getIssueReplies(issueIdx));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return issue;
	}
	
	public void updateMoveIssue(int columnIdx, int[] issues) {
		System.out.println("in service updateMoveIssue");
		KanbanDao dao = getKanbanDao();

		try {
			System.out.println("-------------------------");
			for (int i = 0; i < issues.length; i++) {
				Map<String, Object> parameters = new HashMap<>();
				parameters.put("colIdx", columnIdx);
				System.out.println("colIdx : "+ columnIdx);
				System.out.println("index : "+ i);
				parameters.put("index", i);
				System.out.println("issueIdx : "+ issues[i]);
				parameters.put("issueIdx", issues[i]);
	
				dao.updateMoveIssue(parameters);
			}
			System.out.println("-------------------------");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public boolean UpdateLabel(Label label) {
		KanbanDao dao = getKanbanDao();
		boolean result = false;
		
		try {
			System.out.println("label :" + label);
			result = dao.updateLabel(label) > 0 ? true : false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("result가 뭐니?" + result);
		return result;
	}
	
	
	private KanbanDao getKanbanDao() {
		return sqlSession.getMapper(KanbanDao.class);
	}
	
	private ProjectDao getProjectDao() {
		return sqlSession.getMapper(ProjectDao.class);
	}
}

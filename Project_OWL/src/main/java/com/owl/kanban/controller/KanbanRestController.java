package com.owl.kanban.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.kanban.dto.Issue.IssueProgressType;
import com.owl.kanban.dto.Issue.PriorityType;
import com.owl.kanban.service.KanbanService;
import com.owl.notice.dao.NoticeDao;
import com.owl.notice.dto.Notice;
import com.owl.project.dto.Label;

import lombok.Setter;

@RestController
public class KanbanRestController {
	@Autowired
	private SqlSession sqlSession;

	
	@Autowired
	private KanbanService service;
	
	@RequestMapping("GetLabelList.do")
	public List<Label> getLabelList(int projectIdx) {
		System.out.println("getLabelList : " + projectIdx);
		
		return service.getLabelList(projectIdx);
	}
	
	//칼럼 리스트 select 
	@RequestMapping("GetColumn.do")
	public List<Column> getColum(int projectIdx) {
		System.out.println("-------------------------");
		List<Column> columns= service.getColum(projectIdx);
		System.out.println(columns);
		return columns;		
	}
	//이슈리스트 select 
	@RequestMapping("GetIssue.do")	
	public List<Issue> getIssue(int projectIdx){
		List<Issue> issue = service.getIssue(projectIdx);
		System.out.println(issue);
		return issue;
	}
	//라벨리스트  select 
	@RequestMapping("UpdateColumn.do")
	public int updateColumn(Column column) {
		Column col = new Column();
		
		col.setColname(column.getColname());
		col.setProjectIdx(column.getProjectIdx());
		col.setColIdx(column.getColIdx());
		boolean result = false;
		result = service.updateColumn(col);		
		int columnidx = -1;		
		if(result) {
			columnidx = col.getColIdx();
		};
		
		return columnidx;
	}
	
	@RequestMapping("InsertColumn.do")
	public Column insertColumn(Column column) {
		//System.out.println("insertColumn function in");
		//System.out.println("column : " + column);
		//System.out.println(column.getProjectIdx() + "/" + column.getColname());

		Column col = new Column();
		col.setProjectIdx(column.getProjectIdx());
		col.setColname(column.getColname());
		
		boolean result = false;
		result = service.insertColumn(col); 
		
		Column colobj = null;
				
		if(result) {
			colobj = col;
		};
		
		return colobj;
	}

	
	@RequestMapping(value="InsertIssue.do", method = RequestMethod.POST, consumes = { "multipart/form-data" })     
	public Issue insertIssue(@RequestParam(value = "projectIdx") int projectIdx
							, @RequestParam(value = "issueTitle") String issueTitle
							, @RequestParam(value = "content") String content
							, @RequestParam(value = "orderNum") int orderNum
							, @RequestParam(value = "priorityCode", required = false) String priorityCode
							, @RequestParam(value = "assigned", required = false) String assigned
							, @RequestParam(value = "labelIdx", required = false) String labelIdx
							, @RequestParam(value = "dueDate", required = false) String dueDate
							, @RequestParam(value = "multipartFiles", required = false) List<MultipartFile> multipartFiles
							, @RequestParam(value = "colIdx") int colIdx
							, Principal principal, HttpServletRequest request) {	
		System.out.println("in InsertIssue.do");
		System.out.println("insertIssue controller in");
		System.out.println(projectIdx);
		System.out.println(issueTitle);
		System.out.println(content);
		System.out.println(assigned);
		System.out.println(labelIdx);
		System.out.println(dueDate);
		System.out.println(orderNum);
		System.out.println(priorityCode);
		System.out.println(multipartFiles);
		System.out.println(multipartFiles.size());
		System.out.println("칼럼");
		System.out.println(colIdx);
		
		Issue issue = new Issue();
		issue.setProjectIdx(projectIdx);
		issue.setIssueTitle(issueTitle);
		issue.setContent(content);
		issue.setCreator(principal.getName());
		issue.setIssueProgress(IssueProgressType.OPEN);
		issue.setColIdx(colIdx);
		issue.setOrderNum(orderNum);
		if(!priorityCode.isEmpty())
			issue.setPriorityCode(PriorityType.valueOf(priorityCode));
		if(!assigned.isEmpty())
			issue.setAssigned(assigned);
		if (!labelIdx.isEmpty())
			issue.setLabelIdx(Integer.parseInt(labelIdx));
		if(!dueDate.isEmpty()) {
			try {
				issue.setDueDate(new SimpleDateFormat("yyyy-mm-dd").parse(dueDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		System.out.println("issue");
		System.out.println(issue);
		boolean result = false;
		
		Issue collist = null;
		
		collist = service.insertIssue(issue, multipartFiles, request.getServletContext().getRealPath("upload"));

		System.out.println("collist : " + collist);
		return collist;
	}
	
	
	@RequestMapping("InsertLabel.do")
	public int insertLabel(Label label) {
		System.out.println("insertLabel function in");
		System.out.println("label : " + label);
		System.out.println(label.getProjectIdx() + "/" + label.getLabelColor() + "/" + label.getLabelIdx() + "/" + label.getLabelName());

		Label lb = new Label();
		lb.setLabelColor(label.getLabelColor());
		lb.setLabelName(label.getLabelName());
		lb.setProjectIdx(label.getProjectIdx());

		boolean result = false;
		result = service.insertLabel(lb); 

		int data = -1;		
		if(result) {
			data = lb.getLabelIdx();
			System.out.println("dao에서 가져온 getLabelIdx :" + lb.getLabelIdx() + "/"+ data) ;
		};
		
		return data;
	}

	@RequestMapping(value="DeleteColumn.do", method = RequestMethod.POST)
	public boolean deleteColumn(@RequestParam(value = "colIdx") int colIdx) {
		boolean result = false;
		result = service.deleteColumn(colIdx);
		return result;
	}
	
	@RequestMapping(value="DeleteIssue.do", method = RequestMethod.POST)
	public boolean deleteIssue(@RequestParam(value = "issueIdx") int issueIdx) {
		boolean result = false;
		result = service.deleteIssue(issueIdx);
		System.out.println("delete issue " + result);
		return result;
	}
	
	
	@RequestMapping(value="GetAddIssueForm.do", method = RequestMethod.POST)
	public Map<String, Object> getIssueform(int projectIdx) {
		System.out.println("getIssueform controller in");
		Map<String, Object> object = new HashMap<>();
		
		object = service.getIssueform(projectIdx);
		
		return object;
		
	}
	
	
	
	@RequestMapping(value = "GetIssueDetail.do", method = RequestMethod.POST)
	public Issue getIssueDetail(int projectIdx, int issueIdx) {
		System.out.println("in getIssueDetail : " + issueIdx);
		
		return service.getIssueDetail(projectIdx, issueIdx);
	}
	
	private NoticeDao getNoticeDao() {
		return sqlSession.getMapper(NoticeDao.class);
	}
	

}

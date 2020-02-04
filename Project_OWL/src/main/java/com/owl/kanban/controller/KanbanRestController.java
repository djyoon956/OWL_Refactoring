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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.owl.kanban.dto.Column;
import com.owl.kanban.dto.Issue;
import com.owl.kanban.dto.Issue.IssueProgressType;
import com.owl.kanban.dto.Issue.PriorityType;
import com.owl.kanban.dto.Reply;
import com.owl.kanban.service.KanbanService;
import com.owl.member.dto.Member;
import com.owl.project.dto.Label;


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
		
		List<Column> columns= service.getColum(projectIdx);
		//System.out.println("여기니?");
		//System.out.println("???"+columns);
		return columns;		
	}
	
	//이슈리스트 select 
	@RequestMapping("GetIssue.do")	
	public List<Issue> getIssue(int projectIdx){
		List<Issue> issue = service.getIssue(projectIdx);

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
	
	@RequestMapping(value="InsertColumn.do", method = RequestMethod.POST)
	public Column insertColumn(Column column) {
		System.out.println("insertColumn in");
		System.out.println(column);
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
				issue.setDueDate(new SimpleDateFormat("yyyy-MM-dd").parse(dueDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		boolean result = false;
		
		Issue collist = null;
		
		collist = service.insertIssue(issue, multipartFiles, request.getServletContext().getRealPath("upload"));

		return collist;
	}
	
	
	@RequestMapping("InsertLabel.do")
	public int insertLabel(Label label) {

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
		Map<String, Object> object = new HashMap<>();
		
		object = service.getIssueform(projectIdx);
		
		return object;
		
	}

	@RequestMapping(value = "GetIssueDetail.do", method = RequestMethod.POST)
	public Issue getIssueDetail(int issueIdx) {
		return service.getIssueDetail(issueIdx);
	}
	
	
	
	@RequestMapping(value = "MoveIssue.do", method = RequestMethod.POST)
	public boolean moveIssue(int projectIdx, int targetIssueIdx, int columnIdx, int[] issues, Principal principal) {
		return service.updateMoveIssue(projectIdx, targetIssueIdx, columnIdx, issues, principal.getName());
	}
	
	
	
	@RequestMapping("UpdateLabel.do")
	public int UpdateLabel(Label label) {
		System.out.println("UpdateLabel in");
		System.out.println(label);
		Label lb = new Label();
		lb.setLabelIdx(label.getLabelIdx());
		lb.setLabelColor(label.getLabelColor());
		lb.setLabelName(label.getLabelName());

		boolean result = false;
		result = service.UpdateLabel(label);	
		
		int labelIdx = -1;		
		
		if(result) {
			labelIdx = lb.getLabelIdx();
		};

		return labelIdx;
	}
	
	
	@RequestMapping(value="DeleteLabel.do", method = RequestMethod.POST)
	public boolean deleteLabel(@RequestParam(value = "labelIdx") int labelIdx) {
		boolean result = false;
		result = service.deleteLabel(labelIdx);
		return result;
	}
	
	@RequestMapping(value = "CloseIssue.do", method = RequestMethod.POST)
	public boolean closeIssue(@RequestParam(value = "issueIdx") int issueIdx, Principal principal) {
		boolean result = service.closeIssue(issueIdx, principal.getName());
		return result;
	}
	
	
	@RequestMapping(value = "ReopenIssue.do", method = RequestMethod.POST)
	public boolean reopenIssue(@RequestParam(value = "issueIdx") int issueIdx, Principal principal) {
		boolean result = service.reopenIssue(issueIdx, principal.getName());
		//result.getIssueProgress(issueIdx);
		return result;
	}
	
	
	@RequestMapping(value="InsertReply.do",method = RequestMethod.POST)
	public Reply insertReply(Reply reply) {
		
		Reply re = null;
		re = service.insertReply(reply);

		return re;
	}
	
	
	@RequestMapping(value="DeleteReply.do", method = RequestMethod.POST)
	public boolean deleteReply(@RequestParam(value = "issuerlyidx") int issuerlyidx) {
		boolean result = false;
		result = service.deleteReply(issuerlyidx);
		return result;
	}
	
	/**
	 * 칸반 댓글 수정
	 * @author 배인영
	 * @since 2020/01/29
	 * @param reply
	 * @return boolean
	 */
	@RequestMapping(value="EditReply.do", method = RequestMethod.POST)
	public boolean editReply(Reply reply) {
		boolean result = false;
		
		return service.editReply(reply);
	}
	
	@RequestMapping(value="UpdateIssueTitle.do", method = RequestMethod.POST)
	public boolean updateIssueTitle(Issue issue,Principal principal) {
		boolean result = service.updateIssueTitile(issue, principal.getName());
		
		return result;
	}
	
	@RequestMapping(value="UpdateIssueContent.do", method = RequestMethod.POST)
	public boolean updateIssueContent(Issue issue,Principal principal) {
		boolean result = service.updateIssueContent(issue, principal.getName());
		
		return result;
	}
	
	@RequestMapping(value="UpdateIssuePriority.do", method = RequestMethod.POST)
	public boolean updateIssuePriority(Issue issue,Principal principal) {
		System.out.println("updateIssueTitle in");
		System.out.println(issue);
		boolean result = service.updateIssuePriority(issue, principal.getName());
		
		return result;
	}
	
	@RequestMapping(value="UpdateIssueDuedate.do", method = RequestMethod.POST)
	public boolean updateIssueDuedate(@RequestParam(value = "dueDate", required = false) String dueDate,
			int issueIdx, Principal principal) {
		System.out.println("updateIssueDuedate in  듀데이트 ");
		System.out.println(dueDate);
		Issue issue = new Issue();

		issue.setIssueIdx(issueIdx);
		if(!dueDate.isEmpty()) {
			try {
				issue.setDueDate(new SimpleDateFormat("yyyy-MM-dd").parse(dueDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		boolean result = service.updateIssueDuedate(issue, principal.getName());
		return result;
	}
	
	@RequestMapping(value="UpdateIssueAssgined.do", method = RequestMethod.POST)
	public boolean updateIssueAssgined(Issue issue,Principal principal) {
		boolean result = service.updateIssueAssgined(issue, principal.getName());
		
		return result;
	}
	
	@RequestMapping(value="UpdateIssueLabel.do", method = RequestMethod.POST)
	public boolean updateIssueLabel(@RequestParam(value = "labelIdx", required = false) String labelIdx,int issueIdx,Principal principal) {
		Issue issue = new Issue();
		issue.setIssueIdx(issueIdx);
		System.out.println("update issue label Idx : " +  labelIdx);
		if (!labelIdx.isEmpty())
			issue.setLabelIdx(Integer.parseInt(labelIdx));
		boolean result = service.updateIssueLabel(issue, principal.getName());

		return result;
	}
	
	@RequestMapping(value = "DeleteIssueFile.do", method = RequestMethod.POST)
	public boolean deleteFile(int fileIdx) {
		System.out.println(fileIdx);
		return service.deleteIssueFile(fileIdx);
	}
	
	@RequestMapping(value = "IssueFileEdit.do", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public boolean addIssueFile(@RequestParam(value = "multipartFiles", required = false) List<MultipartFile> multipartFiles
							  ,@RequestParam(value = "issueIdx") int issueIdx
							  ,@RequestParam(value = "projectIdx") int projectIdx
							 ,Principal principal,HttpServletRequest request) {
		System.out.println("addIssueFile rest controller");

		boolean result = false;
		Issue issue = new Issue();
		issue.setCreator(principal.getName());
		issue.setIssueIdx(issueIdx);
		issue.setProjectIdx(projectIdx);
		result = service.addIssueFile(issue,multipartFiles, request.getServletContext().getRealPath("upload"));

		return result;
	}
	
	/**
	 * 칸반 assignee로 검색
	 * @author 배인영
	 * @since 2020/01/30
	 * @param projectIdx
	 * @param content
	 * @return
	 */
	@RequestMapping("SearchAssignee.do")	
	public List<Issue> searchAssignee(int projectIdx, String email){
		List<Issue> issue = service.searchAssignee(projectIdx, email);
		return issue;
	}
	
	/**
	 * 칸반 라벨로 검색
	 * @author 배인영
	 * @since 2020/01/30
	 * @param searchContent
	 * @return List<Issue>
	 */
	@RequestMapping("SearchLabel.do")	
	public List<Issue> searchLabel(int labelIdx){
		
		System.out.println("searchLabel in controller");
		List<Issue> issue = service.searchLabel(labelIdx);
		return issue;
	}
	
	
	/**
	 * 칸반 라벨로 검색
	 * @author 배인영
	 * @since 2020/01/30
	 * @param searchPriority
	 * @return List<Issue>
	 */
	@RequestMapping("SearchPriority.do")	
	public List<Issue> searchPriority(String priorityidx){
		
		System.out.println("searchPriority in controller");
		List<Issue> issue = service.searchPriority(priorityidx);

		return issue;
	}
	
	
	/**
	 * 프로젝트 멤버리스트 select
     * @since 2020/01/30
	 * @param projectIdx
	 * @return List<Member>
	 */
	@RequestMapping("GetProjectMemberList.do")	
	public List<Member> getProjectMemberList(int projectIdx){
		
		System.out.println("getProjectMemberList in controller");
		List<Member> member = service.getProjectMemberList(projectIdx);
		return member;
	}
	
}

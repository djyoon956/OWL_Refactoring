package com.owl.dashBoard.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.owl.dashBoard.dto.IssueTask;
import com.owl.dashBoard.dto.ProjectProgress;
import com.owl.dashBoard.dto.TimeLine;
import com.owl.dashBoard.service.DashBoardService;

@RestController
public class DashBoardRestController {
	
	@Autowired
	private DashBoardService service;
	
	/**
	 * MyDashBoard - 해당 멤버가 참여중인 프로젝트가 존재하는지 체크 요청
	 * @author 윤다정
	 * @since 2020/01/31
	 * @param principal
	 * @return int
	 */
	@RequestMapping("CheckJoinProject.do")
	public int checkJoinProject(Principal principal) {
		return service.checkJoinProject(principal.getName());
	}
	
	/**
	 * Issue Task 테이블 데이터 요청
	 * @author 윤다정
	 * @since 2020/01/31
	 * @param principal
	 * @return List<IssueTask>
	 */
	@RequestMapping("GetMyIssueTask.do")
	public List<IssueTask> getMyIssueTasks(Principal principal) {
		return service.getMyIssueTasks(principal.getName());
	}
	

	/**
	 * 본인에게 할달된 이슈 진행률(프로젝트 별)
	 * @author 이정은
	 * @since 2020/01/31
	 * @param principal
	 * @return List<ProjectProgress>
	 */
	@RequestMapping("MyProjectProgress.do")
	public Map<Integer ,List<ProjectProgress>> getMyProjectChart(Principal principal) {	
		return service.getMyProjectChart(principal.getName());
	}
	
	/**
	 * TimeLine 데이터 요청
	 * @author 윤다정
	 * @since 2020/01/31
	 * @param principal
	 * @return Map<String, List<TimeLine>>
	 */
	@RequestMapping("GetMyTimeLine.do")
	public Map<String, List<TimeLine>> getMyTimeLines(Principal principal) {
		return service.getMyTimeLines(principal.getName());
	}
}

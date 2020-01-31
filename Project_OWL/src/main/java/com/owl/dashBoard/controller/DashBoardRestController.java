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
	 * 본인에게 할당된 이슈 진행률(프로젝트 별 in project)
	 * @author 이정은
	 * @since 2020/01/31 
	 * @param projectIdx
	 * @param principal
	 * @return List<ProjectProgress>
	 */
	@RequestMapping("MyProgress.do")
	public List<ProjectProgress> getProgressChart(int projectIdx, Principal principal) {
		return service.getProgressChart(principal.getName(), projectIdx);
	}
	
	@RequestMapping("Progress.do")
	public List<ProjectProgress> getProjectChart(int projectIdx) {
		return service.getProjectChart(projectIdx);
	}

	/**
	 * 본인에게 할달된 이슈 진행률(프로젝트 별)
	 * @author 이정은
	 * @since 2020/01/31
	 * @param principal
	 * @return Map<Integer ,List<ProjectProgress>>
	 */
	@RequestMapping("MyProjectProgress.do")
	public Map<Integer ,List<ProjectProgress>> getMyProjectChart(Principal principal) {	
		return service.getMyProjectChart(principal.getName());
	}
	
	/**
	 * 프로젝트 내의 라벨별 진행률
	 * @author 이정은
	 * @since 2020/02/01 
	 * @param projectIdx
	 * @return Map<String ,List<ProjectProgress>>
	 */
	@RequestMapping("LabelChart.do")
	public Map<String ,List<ProjectProgress>> getLabelChart(int projectIdx) {	
		return service.getLabelChart(projectIdx);
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

package com.owl.project.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.owl.drive.dto.DriveFolder;
import com.owl.member.dto.Member;
import com.owl.project.dto.Project;
import com.owl.project.dto.ProjectList;
import com.owl.project.service.ProjectService;

@RestController
public class ProjectRestController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;
	
	//Sidebar의 프로젝트 목록 수정
	@RequestMapping("EditMyProject.do")
	public  boolean updateProjectList(String projectIdx, String favorite, String projectColor, ProjectList projectlist, Principal principal) {
		boolean result = false;
		try {
			projectlist.setEmail(principal.getName());
			projectlist.setProjectIdx(projectlist.getProjectIdx());
			projectlist.setFavorite(projectlist.getFavorite());
			projectlist.setProjectColor(projectlist.getProjectColor());
			result = service.updateProjectList(projectlist);						

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//새 프로젝트 추가
	@RequestMapping("InsertNewProject.do")
	public boolean insertNewProject(String projectName, String projectColor, Project project, ProjectList projectlist, Principal principal, DriveFolder drivefolder, HttpServletRequest request) throws Exception {
		boolean result = false;
		try {
		projectlist.setEmail(principal.getName());
		project.setProjectName(project.getProjectName());		
		projectlist.setProjectColor(projectlist.getProjectColor());
		drivefolder.setDepth(0);
		drivefolder.setRef(0);
		result = service.insertNewProject(project, projectlist, drivefolder, request);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}
	
	@RequestMapping("GetProjectList.do")
	public ProjectList getProjectList(int projectIdx, Principal principal, Model model) {
		ProjectList projectList = null;
		projectList = service.getProjectList(projectIdx, principal.getName());
		model.addAttribute("projectList", projectList);
		return projectList;
	}
	
	@RequestMapping("ProjectList.do")
	public List<ProjectList> getDriveList(Principal principal, Model model){
		List<ProjectList> projectList  = null;
		projectList = service.getProjectLists(principal.getName());
		model.addAttribute("projectList", projectList);
	return projectList;
	}
	
	@RequestMapping(value = "AddProjectMember.do", method = RequestMethod.POST)
	public void AddProjectMember(int projectIdx, String projectName, String pm, String[] addProjectMembers, Principal principal) {
		
		try {
			MimeMessage content = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(content, true, "UTF-8");
			Map<String, Object> models = new HashMap<String, Object>();
			models.put("projectName", projectName);
			models.put("joinProjectIdx", projectIdx);
			models.put("pm", pm);
			models.put("pmEamil", principal.getName());

			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "joinProjectTemplate.vm", "UTF-8", models);
			messageHelper.setSubject("[OWL] 프로젝트 초대");
			messageHelper.setFrom("bit4owl@gmail.com");
			messageHelper.setTo(addProjectMembers);
			messageHelper.setText(mailBody, true);
			mailSender.send(content);
			
		} catch (Exception e) {
			System.out.println("이거 에러..>" + e.getMessage());
		}
	}
	
	@RequestMapping(value = "GetProjectMember.do", method = RequestMethod.POST)
	public List<Member> getProjectMembers(int projectIdx) {
		return service.getProjectMembers(projectIdx);
	}
	
	@RequestMapping(value = "OutProject.do", method = RequestMethod.POST)
	public boolean outProject(int projectIdx, Principal principal) {
		return service.outProject(projectIdx, principal.getName());
	}
}

package owl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	@RequestMapping("ProjectDashBoard.do")
	public String showView() {
		return "project/projectDashBoard";
	}
}

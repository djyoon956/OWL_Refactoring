package owl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KanbanController {

	//임시로 만든 칸반 링크 
	//나중에 옮기자
	@RequestMapping("kanbanMain.do")
	public String kanban() {
		return "kanban/kanbanMain";
	}	
	
	
	@RequestMapping("kanbanMain2.do")
	public String kanban2() {
		return "kanban/kanbanMain_jKanban";
	}	
	
	@RequestMapping("kanbanMainChung.do")
	public String kanbanChung() {
		return "kanban/kanban_chung";
	}	
}

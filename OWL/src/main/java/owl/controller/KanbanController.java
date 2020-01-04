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
	
	
	@RequestMapping("kanbanMainChung.do")   //은아가 한 것 
	public String kanbanChung() {
		return "kanban/kanban_chung";
	}	
	
	@RequestMapping("kanbanMainiy.do")      // 2번 수정 됨 
	public String kanbanIy() {
		return "kanban/kanbanMain_iy";
	}	
	
}

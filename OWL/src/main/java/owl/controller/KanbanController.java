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
	
	
	@RequestMapping("kanbanMainiy.do")      // 은아 수정중
	public String kanbanIy() {
		return "kanban/kanbanMain_iy";
	}	
	
	@RequestMapping("kanbanMainiyiy.do")      // 인영수정중
	public String kanbanIyiy() {
		return "kanban/kanbanMain_iy_iy";
	}	
	
	
	@RequestMapping("kanbanMaintest.do")      // testing
	public String kanbantestiy() {
		return "kanban/iytest";
	}	
	
	
}

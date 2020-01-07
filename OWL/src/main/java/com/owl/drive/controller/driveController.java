package com.owl.drive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class driveController {

		@RequestMapping("Drive.do")
		public String showview() {
			return "drive/test";
		}
		
		@RequestMapping("Trash.do")
		public String showTrashview() {
			return "drive/trash";
		}
}

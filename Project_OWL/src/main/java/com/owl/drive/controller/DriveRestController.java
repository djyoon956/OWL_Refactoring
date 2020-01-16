package com.owl.drive.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.owl.drive.dto.DriveFolder;
import com.owl.drive.service.DriveService;
import com.owl.notice.dto.File;
import com.owl.notice.dto.Notice;

@RestController
public class DriveRestController {

	@Autowired
	private DriveService service;
	
	@RequestMapping("GetDrive.do")
	public ModelAndView getDriveView(ModelAndView modelAndView) {
		modelAndView.setViewName("drive/drive");

		return modelAndView;
	}
	
	@RequestMapping(value = "insertFolder.do")
	public boolean insertFolder(DriveFolder drivefolder) {
		boolean result = false;
		try {
		drivefolder.setFolderName(drivefolder.getFolderName());
		drivefolder.setRef(drivefolder.getRef());
		drivefolder.setDepth(drivefolder.getDepth());
		drivefolder.setProjecIdx(drivefolder.getProjecIdx());
		result = service.insertDriveFolder(drivefolder);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}
}

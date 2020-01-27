package com.owl.drive.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.owl.drive.dto.DriveFolder;
import com.owl.drive.service.DriveService;
import com.owl.helper.UploadHelper;


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
	public boolean insertFolder(@RequestParam(value = "text") String folderName,
								@RequestParam(value = "projectIdx") int projectIdx,
								DriveFolder drivefolder, HttpServletRequest request) {
		boolean result = false;
		try {
		
		String uploadPath = request.getServletContext().getRealPath("upload");
		UploadHelper.makeDriveDirectory(uploadPath, projectIdx, folderName);
		
		drivefolder.setFolderName(folderName);
		drivefolder.setProjectIdx(projectIdx);		
		drivefolder.setRef(drivefolder.getRef());
		drivefolder.setDepth(drivefolder.getDepth());
		
		result = service.insertDriveFolder(drivefolder);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;	
	}
	
	@RequestMapping(value = "DriveList.do")
	public List<DriveFolder> getDriveList(int projectIdx){
		System.out.println("idx " + projectIdx);
		List<DriveFolder> folders  = null;
		folders = service.getDriveList(projectIdx);		
		System.out.println(folders);
		return folders;
	}
	
	
	
	
	
	
	
	private void checkDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
	}
}

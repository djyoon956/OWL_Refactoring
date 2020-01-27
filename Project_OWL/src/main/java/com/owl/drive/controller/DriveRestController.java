package com.owl.drive.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.owl.drive.dto.DriveFile;
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
			@RequestParam(value = "projectIdx") int projectIdx, DriveFolder drivefolder, HttpServletRequest request) {
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
	public List<DriveFolder> getDriveList(int projectIdx) {
		System.out.println("idx " + projectIdx);
		List<DriveFolder> folders = null;
		folders = service.getDriveList(projectIdx);
		System.out.println(folders);
		return folders;
	}

	@RequestMapping("DriveFileUpload.do")
	public void driveFileUpload(MultipartFile driveUploadFile, int projectIdx, HttpServletRequest request, Principal principal) {
		String fileName = driveUploadFile.getOriginalFilename();
		String uploadpath = request.getServletContext().getRealPath("upload");

		DriveFile driveFile = new DriveFile();
		driveFile.setCreator(principal.getName());
		driveFile.setDriveIdx(15);
		driveFile.setFileName(fileName);
		driveFile.setFileSize((int) (driveUploadFile.getSize() / 1024));
		
		String filePath = "";
		try {
			filePath = UploadHelper.uploadFileByProject(uploadpath, "drive", projectIdx, fileName,
					driveUploadFile.getBytes()); // full path
			System.out.println("filePath : " + filePath);
			service.insertFile(driveFile);
		} catch (IOException e) {
			if (!filePath.isEmpty())
				UploadHelper.deleteFile(filePath);
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "GetFolderData.do")
	public List<DriveFile> getFolderData(int folderIdx) {
		System.out.println("in getFolderData");
		return service.getFolderData(folderIdx);
	}
}

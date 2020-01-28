package com.owl.drive.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.function.IntPredicate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public int insertFolder(DriveFolder drivefolder, String[] refs, HttpServletRequest request) {
		System.out.println("in insertFolder");
		System.out.println(refs[0]);
		System.out.println(refs.length);
		if (refs.length == 2) { // default 하위
			// refs[0]
		} else {
			// refs[1]+ refs[0]
		}

		try {

		drivefolder.setFolderName(drivefolder.getFolderName());
		drivefolder.setProjectIdx(drivefolder.getProjectIdx());		
		drivefolder.setRef(drivefolder.getRef());
		drivefolder.setDepth(drivefolder.getDepth());
		service.insertDriveFolder(drivefolder);

		String uploadPath = request.getServletContext().getRealPath("upload");
			/*
			 * UploadHelper.makeDriveDirectory(uploadPath, drivefolder.getProjectIdx(),
			 * refs, drivefolder.getDriveIdx());
			 */
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return drivefolder.getDriveIdx();
	}

	@RequestMapping(value="updateFolder.do")
	public boolean updateFolder(String oldName ,@RequestParam(value = "folderName") String folderName , 
														int projectIdx, @RequestParam(value = "driveIdx") int driveIdx ,HttpServletRequest request) {
		boolean result = false;

		return result;
	}
	
	@RequestMapping(value="updateNewName.do")
	public boolean updateNewNameFolder(String oldName ,@RequestParam(value = "folderName") String folderName , 
														int projectIdx, @RequestParam(value = "driveIdx") int driveIdx ,HttpServletRequest request) {
		boolean result = false;
        String oldPath = request.getServletContext().getRealPath("upload") + "\\project\\" + projectIdx + "\\drive\\" + oldName;
        String newPath = request.getServletContext().getRealPath("upload") + "\\project\\" + projectIdx + "\\drive\\" + folderName;
		UploadHelper.renameFolder(oldPath, newPath);		
		result = service.updateNewNameFolder(folderName, driveIdx);	
		return result;
	}
	
	@RequestMapping(value = "DriveList.do")
	public List<DriveFolder> getDriveList(int projectIdx) {
		List<DriveFolder> folders = null;
		folders = service.getDriveList(projectIdx);
		return folders;
	}

	@RequestMapping("DriveFileUpload.do")
	public void driveFileUpload(MultipartFile driveUploadFile, int projectIdx, int folderIdx, HttpServletRequest request, Principal principal) {
		System.out.println("in driveFileUpload");
		System.out.println(projectIdx);
		System.out.println(folderIdx);
	
		String fileName = driveUploadFile.getOriginalFilename();
		String uploadpath = request.getServletContext().getRealPath("upload");

		DriveFile driveFile = new DriveFile();
		driveFile.setCreator(principal.getName());
		driveFile.setDriveIdx(folderIdx);
		driveFile.setFileName(fileName);
		driveFile.setFileSize((int) (driveUploadFile.getSize() / 1024));
		
		String filePath = "";
		try {
			filePath = UploadHelper.uploadFileByProject(uploadpath, "drive", projectIdx, fileName, driveUploadFile.getBytes()); // full path
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
	
	
	@RequestMapping(value = "GetTrashList.do")
	public List<DriveFile> getTrashList(int projectIdx) {
		System.out.println("in getTrashList");
		return service.getTrashList(projectIdx);
	}
	
	@RequestMapping(value = "DeleteDriveFile.do")
	public boolean deleteDriveFile(int driveFileIdx) {
		System.out.println("in deleteDriveFile");
		System.out.println(driveFileIdx);
		
		return service.deleteFileFromDrive(driveFileIdx);
	}
	
	@RequestMapping(value = "RenameDriveFile.do")
	public boolean renameDriveFile(int driveFileIdx, String fileName) {
		System.out.println("in renameDriveFile");
		System.out.println(driveFileIdx);

		return service.renameFile(driveFileIdx, fileName);
	}
	
	
	@RequestMapping(value = "DeleteFileFromTrash.do")
	public boolean deleteFilefromTrash(int driveFileIdx, String fileName) {
		System.out.println("in deleteFilefromTrash");
		System.out.println(driveFileIdx);
		
		return service.deleteFilefromTrash(driveFileIdx);
	}
	
	
	@RequestMapping(value = "RestoreFile.do")
	public boolean restoreFilefromTrash(int driveFileIdx) {
		System.out.println("in restoreFilefromTrash");
		System.out.println(driveFileIdx);

		return service.restoreFilefromTrash(driveFileIdx);
	}
	
	
	
	
}

package com.owl.drive.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
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
		
		List<Integer> driveRefs = new ArrayList<Integer>();
		if (refs.length == 2) { // default 하위
			driveRefs.add(Integer.parseInt(refs[0]));
		} else {
			driveRefs.add(Integer.parseInt(refs[1]));
			driveRefs.add(Integer.parseInt(refs[0]));
		}
	
		try {
			drivefolder.setFolderName(drivefolder.getFolderName());
			drivefolder.setProjectIdx(drivefolder.getProjectIdx());
			drivefolder.setRef(drivefolder.getRef());
			drivefolder.setDepth(drivefolder.getDepth());
			service.insertDriveFolder(drivefolder);

			String uploadPath = request.getServletContext().getRealPath("upload");

			UploadHelper.makeDriveDirectory(uploadPath, drivefolder.getProjectIdx(),
					driveRefs.stream().mapToInt(i -> i).toArray(), drivefolder.getDriveIdx());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return drivefolder.getDriveIdx();
	}

	@RequestMapping(value="cutFolder.do")
	public boolean cutFolder(DriveFolder drivefolder, String[] refs, int oldRef, HttpServletRequest request) {
		boolean result = false;
		String oldPath = "";
		System.out.println(drivefolder);
		System.out.println(oldRef);
		
		List<Integer> driveRefs = new ArrayList<Integer>();
		if (refs.length == 2) { // default 하위
			driveRefs.add(Integer.parseInt(refs[0]));
			oldPath = request.getServletContext().getRealPath("upload") + "\\project\\" 
									+ drivefolder.getProjectIdx() + "\\drive\\" +Integer.parseInt(refs[0])+"\\"+ oldRef +"\\"+ drivefolder.getDriveIdx();
		} else {
			driveRefs.add(Integer.parseInt(refs[1]));
			driveRefs.add(Integer.parseInt(refs[0]));
			oldPath = request.getServletContext().getRealPath("upload") + "\\project\\" 
									+ drivefolder.getProjectIdx()+ "\\drive\\" +Integer.parseInt(refs[1]) +"\\" +oldRef +"\\"+ drivefolder.getDriveIdx();
		}
        
		try {
			drivefolder.setFolderName(drivefolder.getFolderName());
			drivefolder.setProjectIdx(drivefolder.getProjectIdx());
			drivefolder.setRef(drivefolder.getRef());
			drivefolder.setDepth(drivefolder.getDepth());
			service.updateFolder(drivefolder);

			String uploadPath = request.getServletContext().getRealPath("upload");
			UploadHelper.moveDriveDirectory(oldPath, uploadPath, drivefolder.getProjectIdx(),
						driveRefs.stream().mapToInt(i -> i).toArray(), drivefolder.getDriveIdx());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}
	
	@RequestMapping(value="copyFolder.do")
	public boolean copyFolder(DriveFolder drivefolder, String[] refs, int parent, HttpServletRequest request) {
		boolean result = false;
		
		List<Integer> driveRefs = new ArrayList<Integer>();
		if (refs.length == 2) { // default 하위
			if(parent ==Integer.parseInt(refs[0])) {
				driveRefs.add(Integer.parseInt(refs[0]));	 //default
			}else {				
				driveRefs.add(Integer.parseInt(refs[0])); //default
				driveRefs.add(parent);
			}
					
		} else {
			driveRefs.add(Integer.parseInt(refs[1]));
			driveRefs.add(Integer.parseInt(refs[0]));			
		}        
		try {
			drivefolder.setFolderName(drivefolder.getFolderName());
			drivefolder.setProjectIdx(drivefolder.getProjectIdx());
			drivefolder.setRef(drivefolder.getRef());
			drivefolder.setDepth(drivefolder.getDepth());
			service.updateFolder(drivefolder);

			String uploadPath = request.getServletContext().getRealPath("upload");
			UploadHelper.makeDriveDirectory(uploadPath, drivefolder.getProjectIdx(),
						driveRefs.stream().mapToInt(i -> i).toArray(), drivefolder.getDriveIdx());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return result;
	}

	@RequestMapping(value="updateNewName.do")
	public boolean updateNewNameFolder(String folderName , int driveIdx ,HttpServletRequest request) {
		boolean result = false;	
		result = service.updateNewNameFolder(folderName, driveIdx);	
		return result;
	}
	
	@RequestMapping(value = "DriveList.do")
	public List<DriveFolder> getDriveList(int projectIdx) {
		List<DriveFolder> folders = null;
		folders = service.getDriveList(projectIdx);
		return folders;
	}

	/**
	 * 드라이브 해당 폴더에 다중 파일 업로드
	 * @author 윤다정
	 * @since 2020/01/29
	 * @param driveUploadFiles
	 * @param projectIdx
	 * @param folderIdx
	 */
	@RequestMapping("DriveFileUpload.do")
	public void driveFileUpload(@RequestParam("driveUploadFiles") List<MultipartFile> driveUploadFiles, int projectIdx, int folderIdx, HttpServletRequest request, Principal principal) {
		System.out.println("in driveFileUpload");
		System.out.println(projectIdx);
		System.out.println(folderIdx);
		System.out.println(driveUploadFiles.size());
	
		driveUploadFiles.forEach(file -> {
			String fileName = file.getOriginalFilename();
			String uploadpath = request.getServletContext().getRealPath("upload");

			DriveFile driveFile = new DriveFile();
			driveFile.setCreator(principal.getName());
			driveFile.setDriveIdx(folderIdx);
			driveFile.setFileName(fileName);
			driveFile.setFileSize((int) (file.getSize() / 1024));
			
			String filePath = "";
			try {
				filePath = UploadHelper.uploadFileByProject(uploadpath, "drive", projectIdx, fileName, file.getBytes()); 
				System.out.println("filePath : " + filePath);
				service.insertFile(driveFile);
			} catch (IOException e) {
				if (!filePath.isEmpty())
					UploadHelper.deleteFile(filePath);
				e.printStackTrace();
			}
		});
	}

	@RequestMapping(value = "GetFolderData.do")
	public List<DriveFile> getFolderData(int folderIdx) {
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

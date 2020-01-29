package com.owl.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;

public class UploadHelper {
	public static String uploadFile(String uploadPath, String uploadType, String fileName, byte[] content) {
		uploadPath = Paths.get(uploadPath, uploadType).toString();
		makeDirectory(uploadPath);
		String path = Paths.get(uploadPath, fileName).toString();
		try (FileOutputStream fs = new FileOutputStream(path)) {
			fs.write(content);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileName;
	}

	public static String uploadFileByProject(String uploadPath, String uploadType, int projectIdx, String fileName, byte[] content) {
		uploadPath = Paths.get(uploadPath, "project", Integer.toString(projectIdx), uploadType).toString();
		makeDirectory(uploadPath);

		String path = Paths.get(uploadPath, fileName).toString();
		try (FileOutputStream fs = new FileOutputStream(path)) {
			fs.write(content);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return path;
	}
	
	public static String uploadFileByProjectDrive(String uploadPath, String uploadType, int projectIdx,String[] refs,int folderIdx, String fileName, byte[] content) {
		uploadPath = Paths.get(uploadPath
											, "project"
											, Integer.toString(projectIdx)
											, uploadType
											, getParentPath(refs)
											, Integer.toString(folderIdx)).toString();
		
		makeDirectory(uploadPath);
		
		String path = Paths.get(uploadPath, fileName).toString();
		try (FileOutputStream fs = new FileOutputStream(path)) {
			fs.write(content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return path;
	}

	public static void makeDriveDirectory(String uploadPath, int projectIdx, String[] refs, int driveIdx) {
		String path = Paths.get(uploadPath
											, "project"
											, Integer.toString(projectIdx)
											, "drive"
											, getParentPath(refs)
											, Integer.toString(driveIdx)).toString();
		makeDirectory(path);
	}

	public static void makeDefaultDirectory(String uploadPath, int projectIdx, int driveIdx) {
		String path = Paths.get(uploadPath
											, "project"
											, Integer.toString(projectIdx)
											, "drive"
											, Integer.toString(driveIdx)).toString();
		makeDirectory(path);
		System.out.println(path);
	}
	 
	 public static void copyDriveDirectory(String oldPath, String uploadPath, int projectIdx, int[] refs, int driveIdx) { 
		String refPath = "";
		 File oldDirectory = new File(oldPath);
				for (int i = 0; i < refs.length; i++) {
					if (i == refs.length - 1)
						refPath += refs[i];
					else
						refPath += refs[i] + File.separator;
				}
				String path = Paths.get(uploadPath, "project", Integer.toString(projectIdx), "drive", refPath, Integer.toString(driveIdx)).toString();
				makeDirectory(path);
		File newDirectory = new File(path);
		
			try {
			    FileUtils.copyDirectory(oldDirectory, newDirectory);
			} catch (Exception e) {
			    e.printStackTrace();
			}	   
	
	}

	public static void deleteFile(String path) {
		File file = new File(path);
		if (file.exists())
			file.delete();
	}

	public static void moveDriveDirectory(String oldPath, String uploadPath, int projectIdx, String[] refs, int driveIdx) {
		String newPath = Paths.get(uploadPath
													, "project"
													, Integer.toString(projectIdx)
													, "drive"
													, getParentPath(refs) 
													, Integer.toString(driveIdx)).toString();

		File oldDirectory = new File(oldPath);
		File newDirectory = new File(newPath);
		boolean isMove = oldDirectory.renameTo(newDirectory);
		System.out.println("파일 이동 성공 : " + isMove);
	}

	private static void makeDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
	}
	
	/**
	 * 드라이브 디폴트 디렉토리부터 경로 설정
	 * @author 윤다정
	 * @since 2019/01/29
	 * @param refs
	 * @return refPath
	 */
	private static String getParentPath(String[] refs) {
		String refPath = "";
		if (refs.length == 2)
			refPath = refs[0];
		else if (refs.length == 3)
			refPath = refs[1] + File.separator + refs[0];

		System.out.println("refPath : " + refPath);
		
		return refPath;
	}
}

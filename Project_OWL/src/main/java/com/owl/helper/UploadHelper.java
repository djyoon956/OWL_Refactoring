package com.owl.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

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

	public static void makeDefaultDirectory(String uploadPath, int projectIdx, int driveIdx) {
		String path = Paths.get(uploadPath, "project", Integer.toString(projectIdx), "drive", Integer.toString(driveIdx)).toString();
		makeDirectory(path);
	}


	 public static void makeDriveDirectory(String uploadPath, int projectIdx, int[] refs, int driveIdx) { 
		System.out.println("in makeDriveDirectory");
		String refPath = "";
		for (int i = 0; i < refs.length; i++) {
			if (i == refs.length - 1)
				refPath += refs[i];
			else
				refPath += refs[i] + File.separator;
		}
		System.out.println(refPath);
		String path = Paths
				.get(uploadPath, "project", Integer.toString(projectIdx), "drive", refPath, Integer.toString(driveIdx))
				.toString();
		System.out.println(path);
		makeDirectory(path);
	}

	public static void deleteFile(String path) {
		File file = new File(path);
		if (file.exists())
			file.delete();
	}
	
	public static void renameFolder(String oldPath, String newPath) {
		File oldDirectory = new File(oldPath);
		oldDirectory.renameTo(new File(newPath));
	}
	
	private static void makeDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
	}
}

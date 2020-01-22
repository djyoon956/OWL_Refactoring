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
		uploadPath = Paths.get(uploadPath,Integer.toString(projectIdx), uploadType).toString();
		makeDirectory(uploadPath);

		String path = Paths.get(uploadPath, fileName).toString();
		try (FileOutputStream fs = new FileOutputStream(path)) {
			fs.write(content);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return path;
	}

	public static void makeDriveDirectory(String uploadPath, int projectIdx, String folderName) {
		String path = Paths.get(uploadPath, "project", Integer.toString(projectIdx), "drive", folderName).toString();
		makeDirectory(path);
	}

	private static void makeDirectory(String path) {
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
	}
}

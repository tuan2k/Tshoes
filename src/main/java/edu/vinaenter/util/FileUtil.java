package edu.vinaenter.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import edu.vinaenter.contant.GlobalContant;

public class FileUtil {

	// create methods to upload file ( create folder)
	public static String upload(MultipartFile file,HttpServletRequest req) {
		if (file != null) {
			if (!GlobalContant.EMPTY_VALUE.equals(file.getOriginalFilename())) {
				String userDir = req.getServletContext().getRealPath("") + File.separator + "WEB-INF/resources";
				String dirPath = userDir + File.separator + GlobalContant.DIR_UPLOAD;
				File saveDir = new File(dirPath);
				if (!saveDir.exists()) {
					saveDir.mkdir();
				}
				String fileName = rename(file.getOriginalFilename());// call method rename
				String pathFile = dirPath + File.separator + fileName;
				//System.out.println(pathFile);
				try {
					file.transferTo(new File(pathFile));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return fileName;
			}
		}
		return GlobalContant.EMPTY_VALUE;
	}
	
	public static String rename(String fileName) {
		if (!GlobalContant.EMPTY_VALUE.equals(fileName)) {
			StringBuilder sb = new StringBuilder();
			sb.append(FilenameUtils.getBaseName(fileName)).append("-").append(System.nanoTime()).append(".")
					.append(FilenameUtils.getExtension(fileName));
			return sb.toString();
		}
		return GlobalContant.EMPTY_VALUE;
	}

}

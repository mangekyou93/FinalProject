package com.fp.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	public String fileSave(MultipartFile multipartFile, HttpSession session, String path) throws Exception {
		// 경로 설정(realPath)
		String filePath = session.getServletContext().getRealPath("resources/"+path);
		System.out.println(filePath);
		File file = new File(filePath);
		
		if(file.exists())
		{
			file.mkdirs();	//폴더밑에 폴더밑에 이런식으로 만들어줄 수 있다.
			//file.mkdir();	//폴더 하나만을 만들어준다.
		}
		
		// fileName
		String fileName = multipartFile.getOriginalFilename();
		fileName.substring(fileName.lastIndexOf('.'));
		fileName = UUID.randomUUID().toString()+fileName;
		
		file = new File(filePath, fileName);
		
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	
}

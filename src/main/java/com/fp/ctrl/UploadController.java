package com.fp.ctrl;

import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fp.upload.UploadService;

@Controller
@RequestMapping(value="/upload/*")
public class UploadController {

	@Inject
	UploadService uploadService;
	
	@RequestMapping(value="boardInsert")
	@ResponseBody 
	public String boardInsert(MultipartFile[] file, ModelAndView mv, HttpSession session) throws Exception {
		
		String fileName="";
		for(int i=0; i<file.length; i++) {
			System.out.println("FILE : "+file[i].getOriginalFilename());
		}
		try {
			 fileName = uploadService.boardFileInsert(file, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return  URLEncoder.encode(fileName, "UTF-8");
	}
	
}

package com.fp.ctrl;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fp.upload.UploadDTO;
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
		
		return  fileName;
	}
	
	@RequestMapping(value="fileFakeDelete")
	@ResponseBody
	public String fileFakeDelete(String fileName, HttpSession session) throws Exception {
		int count = uploadService.boardDelete(fileName, session);
		System.out.println("fileName : "+fileName);
		String message = "삭제실패"; 
		if(count>0) {
			message = "삭제성공";
		} 
		return message;
	}
	
	@RequestMapping(value="filedown", method=RequestMethod.GET)
	public ModelAndView filedown(String file_name,String ori_name,HttpSession session) throws Exception {
		System.out.println("file : "+file_name);
		System.out.println("ori : "+ori_name);
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File file = new File(filePath, ori_name+"#"+file_name);
		System.out.println(ori_name+"#"+file_name);
		ModelAndView mv = new ModelAndView();
		mv.addObject("down", file);
		mv.addObject("oriName", ori_name);
		mv.addObject("fileName", file_name);
		mv.setViewName("filedown");
		return mv;
	}
}

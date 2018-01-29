package com.fp.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownload extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		File file = (File)model.get("down");
		response.setCharacterEncoding("UTF-8");
		response.setContentLength((int)file.length());					//내가 보내주는 파일의 크기
		
		String oriName= (String)model.get("oriName");
		System.out.println("D_ori_name : "+oriName);
		String fileName = URLEncoder.encode(oriName, "UTF-8");	//파일명을 UTF-8로 인코딩
		System.out.println("D_file_namme : "+fileName);
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		FileInputStream fi = null;
		
		fi = new FileInputStream(file);
		
		FileCopyUtils.copy(fi, out);
		
		fi.close();
		out.close();
		
		/* 키가 뭐가 있는지 보는 방법.
		Iterator<String> map = model.keySet().iterator();
		
		while(map.hasNext())
		{
			System.out.println(map.next());
		}
		*/
	}
}

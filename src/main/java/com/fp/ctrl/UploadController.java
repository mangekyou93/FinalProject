package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.upload.UploadService;

@Controller
@RequestMapping(value="/upload/*")
public class UploadController {

	@Inject
	UploadService uploadService;
	
}

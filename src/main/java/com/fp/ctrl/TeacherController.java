package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.teacher.TeacherService;

@Controller
@RequestMapping(value="/teacher/*")
public class TeacherController {

	@Inject
	TeacherService teacherService;
	
}

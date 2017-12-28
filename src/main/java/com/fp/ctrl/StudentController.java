package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.student.StudentService;

@Controller
@RequestMapping(value="/student/*")
public class StudentController {

	@Inject
	StudentService studentService;
	
}

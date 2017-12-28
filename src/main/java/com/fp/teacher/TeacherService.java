package com.fp.teacher;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TeacherService {

	@Inject
	TeacherDAO teacherDAO;
	
}

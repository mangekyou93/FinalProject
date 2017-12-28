package com.fp.student;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class StudentService {

	@Inject
	StudentDAO studentDAO;
	
}

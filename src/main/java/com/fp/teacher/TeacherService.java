package com.fp.teacher;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fp.member.MemberDTO;

@Service
public class TeacherService {

	@Inject
	TeacherDAO teacherDAO;
	
	
	public TeacherDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return teacherDAO.memberLogin(memberDTO);
	}
}

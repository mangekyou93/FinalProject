package com.fp.student;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fp.member.MemberDTO;

@Service
public class StudentService {

	@Inject
	StudentDAO studentDAO;
	
	public StudentDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return studentDAO.memberLogin(memberDTO);
	}
}

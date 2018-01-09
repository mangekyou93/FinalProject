package com.fp.student;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fp.member.MemberDTO;

@Service
public class StudentService {

	@Inject
	StudentDAO studentDAO;
	
//학생회원 로그인
	public StudentDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return studentDAO.memberLogin(memberDTO);
	}
//학생회원 탈퇴
	public int studentDelete(int member_seq) throws Exception {
		
		return studentDAO.memberDelete(member_seq);
	}
	
	
}

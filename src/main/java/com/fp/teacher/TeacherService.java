package com.fp.teacher;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fp.member.MemberDTO;

@Service
public class TeacherService {

	@Inject
	TeacherDAO teacherDAO;
	
//선생님회원 로그인	
	public TeacherDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return teacherDAO.memberLogin(memberDTO);
	}
//선생님회원 탈퇴
	public int teacherDelete(int member_seq) throws Exception {
		
		return teacherDAO.memberDelete(member_seq);
	}
}

package com.fp.teacher;

import java.util.List;

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
//선생님회원 추가
	public int teacherInsert(TeacherDTO teacherDTO) throws Exception {
		
		return teacherDAO.teacherInsert(teacherDTO);
	}
//선생님회원 전체 조회
	public List<TeacherDTO> teacherSelectList() throws Exception {

		return teacherDAO.teacherSelectList();
	}
	
//선생님회원 경력 추가 및 수정
	public int teacherCareer(TeacherDTO teacherDTO) throws Exception {
		
		return teacherDAO.teacherCareer(teacherDTO);
	}
	
//선생님회원 탈퇴
	public int teacherDelete(int member_seq) throws Exception {
		
		return teacherDAO.memberDelete(member_seq);
	}
	
//강사 커리어 수정
	public String careerWrite(TeacherDTO teacherDTO) throws Exception {
		
		int result = teacherDAO.careerWrite(teacherDTO);
		String message = "경력을 수정하지 못했습니다.";
		
		if(result > 0)
		{
			message = "경력을 수정하였습니다.";
		}
		
		return message;
	}
}

package com.fp.student;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.member.MemberDTO;

@Repository
public class StudentDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "studentMapper.";

//학생회원 로그인	
	public StudentDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
//학생회원 탈퇴
	public int memberDelete(int member_seq) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"memberDelete", member_seq);
	}
//학생회원 추가
	public int memberInsert(StudentDTO studentDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberInsert", studentDTO);
	}
}

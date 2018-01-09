package com.fp.teacher;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.member.MemberDTO;

@Repository
public class TeacherDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "teacherMapper.";
	
//선생님회원 로그인	
	public TeacherDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
//선생님회원 탈퇴
	public int memberDelete(int member_seq) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"memberDelete", member_seq);
	}
}

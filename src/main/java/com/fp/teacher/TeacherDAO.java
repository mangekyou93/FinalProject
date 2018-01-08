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
	
	
	public TeacherDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
}

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
	
	public StudentDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
}

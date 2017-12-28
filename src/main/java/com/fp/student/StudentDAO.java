package com.fp.student;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "studentMapper.";
	
}

package com.fp.teacher;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "teacherMapper.";
}

package com.fp.upload;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UploadDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "uploadMapper.";
	
}

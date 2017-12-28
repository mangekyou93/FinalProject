package com.fp.reply;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "replyMapper.";
	
}

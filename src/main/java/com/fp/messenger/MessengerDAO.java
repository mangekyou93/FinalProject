package com.fp.messenger;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessengerDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "messengerMapper.";
	
}

package com.fp.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "memberMapper.";

	
//네이버 체크
	public MemberDTO memberCheck(String email) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberCheck", email);
	}
}

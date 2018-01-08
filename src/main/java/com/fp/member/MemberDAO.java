package com.fp.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "memberMapper.";
	
//일반 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", checkId);
	}
	
//일반  JOIN
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
//일반 LOGIN
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
//state Update
	public int stateUpate(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"stateUpdate", memberDTO);
	}
	
//네이버 체크
	public MemberDTO naverIdCheck(String email) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberCheck", email);
	}
		
}

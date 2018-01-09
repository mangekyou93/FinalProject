package com.fp.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "memberMapper.";
	
//일반회원 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", checkId);
	}
	
//일반회원  JOIN
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
//일반회원 LOGIN
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
//일반회원 삭제
	public int memberDelete(int member_seq) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"memberDelete", member_seq);
	}
//일반회원 비밀번호 수정
	public int memberPwUpdate(MemberDTO memberDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"memberPwUpdate", memberDTO);
	}	
//일반회원 정보 수정
	public int memberInfoUpdate(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"memberInfoUpdate", memberDTO);
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

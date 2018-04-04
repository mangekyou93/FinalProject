package com.fp.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.util.RowNum;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "memberMapper.";
	
	
//일반회원 selectOne
	public MemberDTO selectOne(int member_seq) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"selectOne", member_seq);
	}
	
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
	
//일반회원 아이디 찾기
	public List<MemberDTO> memberIdFind(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"memberIdFind", memberDTO);
	}
//일반회원 비밀번호 찾기
	public List<MemberDTO> memberPwFind(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"memberPwFind", memberDTO);
	}
//일반회원 임시비밀번호 업데이트
	public int memberPwFindUpdate(MemberDTO memberDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"memberPwFindUpdate", memberDTO);
	}
//일반회원 -> 학생
	public int memberStudentUpdate(MemberDTO memberDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"memberStudentUpdate", memberDTO);
	}
	
//state Update
	public int stateUpate(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"stateUpdate", memberDTO);
	}
	
//네이버 체크
	public MemberDTO naverIdCheck(String email) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"naverMemberCheck", email);
	}
//네이버 로그인
	public MemberDTO naverMemberLogin(String id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"naverMemberLogin", id);
	}

//totalCount
	public int memberTotalCount() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberTotalCount");
	}
//관리자 페이지
	public List<MemberDTO> memberManagement(RowNum rowNum) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"memberManagement", rowNum);
	}
//관리자로 일반회원 -> 강사
	public int memberTeacherUpdate(int member_seq) throws Exception {
		
		return sqlSession.update(NAMESPACE+"memberTeacherUpdate", member_seq);
	}
		
}

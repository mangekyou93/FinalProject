package com.fp.upload;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.member.MemberDTO;

@Repository
public class UploadDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "uploadMapper.";
	
//회원가입 이미지 업로드
	public int memberImageInsert(UploadDTO uploadDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberImageInsert", uploadDTO);
	}
//로그인 사진 불러오기
	public UploadDTO memberImageOne(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberImageOne", memberDTO);
	}
//회원 프로필 사진 삭제(회원탈퇴)	
	public int memberImageDelete(int member_seq) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"memberImageDelete", member_seq);
	}
//회원 프로필 사진 수정
	public int memberImageUpdate(UploadDTO uploadDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberImageUpdate", uploadDTO);
	}
	
	public int noticeInsert(UploadDTO uploadDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"noticeInsert", uploadDTO);
	}
	
	public int noticeDelete(int board_seq) throws Exception {
		return sqlSession.delete(NAMESPACE+"noticeDelete", board_seq);
	}
	
	public List<UploadDTO> noticeSelect(int board_seq) throws Exception {
		return sqlSession.selectList(NAMESPACE+"noticeSelect", board_seq);
	}
	
	public int noticeDeleteString(String ori_name) throws Exception {
		return sqlSession.delete(NAMESPACE+"noticeDeleteString", ori_name);
	}
}

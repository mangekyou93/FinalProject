package com.fp.upload;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fp.member.MemberDTO;

@Service
public class UploadService {

	@Inject
	UploadDAO uploadDAO;

//회원가입 이미지 업로드
	public int memberImageInsert(UploadDTO uploadDTO) throws Exception {
		
		return uploadDAO.memberImageInsert(uploadDTO);
	}
//로그인 사진 불러오기
	public UploadDTO memberImageOne(MemberDTO memberDTO) throws Exception {
		
		return uploadDAO.memberImageOne(memberDTO);
	}
//회원 프로필 사진 삭제(회원탈퇴)
	public int memberImageDelete(int member_seq) throws Exception {
		
		return uploadDAO.memberImageDelete(member_seq);
	}
//회원 프로필 사진 수정
	public int memberImageUpdate(UploadDTO uploadDTO) throws Exception {
		
		return uploadDAO.memberImageUpdate(uploadDTO);
	}
}

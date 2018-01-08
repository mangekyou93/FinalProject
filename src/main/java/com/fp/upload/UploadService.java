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
}

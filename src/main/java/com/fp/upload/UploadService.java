package com.fp.upload;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fp.member.MemberDTO;
import com.fp.util.FileSaver;

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
//자유게시판 파일 임시 업로드
	public String boardFileInsert(MultipartFile[] file, HttpSession session) throws Exception {
		FileSaver fileSaver = new FileSaver();
		String fileName = fileSaver.fileSave(file, session, "upload");
		return fileName;
	}
}

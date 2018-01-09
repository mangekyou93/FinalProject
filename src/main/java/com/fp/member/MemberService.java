package com.fp.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.student.StudentDTO;
import com.fp.student.StudentService;
import com.fp.teacher.TeacherService;
import com.fp.upload.UploadDTO;
import com.fp.upload.UploadService;
import com.fp.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private StudentService studentService;
	@Inject
	private TeacherService teacherService;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private UploadService uploadService;
	
//일반회원 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		String id = memberDAO.memberIdCheck(checkId);
		String result = "사용 가능한 아이디입니다.";
		
		if(checkId.equals(id))
		{
			result = "이미 가입된 아이디입니다.";
		}
		
		return result;
	}
	
//일반회원 JOIN
	public RedirectAttributes memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
	
		//DB member에 데이터 삽입
		int result = memberDAO.memberJoin(memberDTO);
		String message = "회원가입 실패";
		
		//DB upload에 데이터 삽입 & 실제 업로드
		if(memberDTO.getFiles().getOriginalFilename() != "")
		{
			UploadDTO uploadDTO = new UploadDTO();
			uploadDTO.setFile_name(fileSaver.fileSave(memberDTO.getFiles(), session, "upload"));
			uploadDTO.setOri_name(memberDTO.getFiles().getOriginalFilename());
			
			result = uploadService.memberImageInsert(uploadDTO);
		}
		
		if(result > 0)
		{
			message = "회원가입 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return rd;
	}
//일반회원 LOGIN
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		memberDTO = memberDAO.memberLogin(memberDTO);
		this.stateUpdate(memberDTO);
		
		if(memberDTO.getKind().equals("student"))
		{
			memberDTO = studentService.memberLogin(memberDTO);
		}
		else if(memberDTO.getKind().equals("teacher"))
		{
			memberDTO = teacherService.memberLogin(memberDTO);
		}
		
		return memberDTO;
		
	}
	
//일반회원 삭제
	public String memberDelete(HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String message = "탈퇴되었습니다.";
		
		int result = memberDAO.memberDelete(memberDTO.getMember_seq());
		
		if(memberDTO.getKind().equals("student"))
		{
			result = studentService.studentDelete(memberDTO.getMember_seq());
		}
		else if(memberDTO.getKind().equals("teacher"))
		{
			result = teacherService.teacherDelete(memberDTO.getMember_seq());
		}
		
		if(session.getAttribute("profileImage") != null)
		{
			result = uploadService.memberImageDelete(memberDTO.getMember_seq());			
		}
		
		if(result > 0)
		{
			session.invalidate();
		}
		else
		{
			message = "오류: 삭제되지 않았습니다.";
		}
		
		return message;
	}
	
//일반회원 비밀번호 수정 POST
	public String memberPwUpdate(HttpSession session, String newPw) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setPw(newPw);
		
		int result = memberDAO.memberPwUpdate(memberDTO);
		String path = "";
		
		if(result > 0)
		{
			path = "redirect:/";
			session.invalidate();
		}
		
		return path;
	}
	
//일반회원 정보 수정 POST
public String memberInfoUpdate(HttpSession session, MemberDTO memberDTO) throws Exception {
		
		int result = memberDAO.memberInfoUpdate(memberDTO);
		String message = "오류 : 변경되지 않았습니다.";
		
		//DB upload에 
		if(memberDTO.getFiles().getOriginalFilename() != "")
		{
			UploadDTO uploadDTO = new UploadDTO();
			uploadDTO.setFile_name(fileSaver.fileSave(memberDTO.getFiles(), session, "upload"));
			uploadDTO.setOri_name(memberDTO.getFiles().getOriginalFilename());
			
			result = uploadService.memberImageInsert(uploadDTO);
		}
		
		if(result > 0)
		{
			message = "회원정보가 변경되었습니다. 다시 로그인 해주세요.";
			session.invalidate();
		}
		
		return message;
	}
	
	
//state Update
	public int stateUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.stateUpate(memberDTO);
	}
	
//네이버 체크
	public MemberDTO naverIdCheck(String email) throws Exception {
			
		return memberDAO.naverIdCheck(email);
	}
}

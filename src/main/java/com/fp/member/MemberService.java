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
	
//일반 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		String id = memberDAO.memberIdCheck(checkId);
		String result = "사용 가능한 아이디입니다.";
		
		if(checkId.equals(id))
		{
			result = "이미 가입된 아이디입니다.";
		}
		
		return result;
	}
	
//일반 JOIN
	public RedirectAttributes memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
	
		//DB member에 데이터 삽입
		int result = memberDAO.memberJoin(memberDTO);
		String message = "회원가입 실패";
		
		//DB upload에 데이터 삽입 & 실제 업로드
		if(memberDTO.getFiles() != null)
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
//일반 LOGIN
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
//state Update
	public int stateUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.stateUpate(memberDTO);
	}
	
//네이버 체크
	public MemberDTO naverIdCheck(String email) throws Exception {
			
		return memberDAO.naverIdCheck(email);
	}
}

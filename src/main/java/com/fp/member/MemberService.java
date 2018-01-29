package com.fp.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.student.StudentDTO;
import com.fp.student.StudentService;
import com.fp.teacher.TeacherDTO;
import com.fp.teacher.TeacherService;
import com.fp.upload.UploadDTO;
import com.fp.upload.UploadService;
import com.fp.util.FileSaver;
import com.fp.util.ListData;
import com.fp.util.Pager;
import com.fp.util.RowNum;

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
	
//일반회원 selectOne
	public MemberDTO selectOne(int member_seq) throws Exception {

		return memberDAO.selectOne(member_seq);
	}
	
//일반회원 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		String id = "";
		
		try{
			id = memberDAO.memberIdCheck(checkId);			
		}
		catch(Exception e){
			e.printStackTrace();
			id = "";
		}
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
public String memberInfoUpdate(HttpSession session, MemberDTO memberDTO, int counting) throws Exception {
		
		int result = memberDAO.memberInfoUpdate(memberDTO);
		String message = "오류 : 변경되지 않았습니다.";
		UploadDTO uploadDTO = null;
		
		//추가 및 변경
		if(memberDTO.getFiles().getOriginalFilename() != "")//이미 있는데 수정하는 방법 & 없는데 추가
		{
			try {
				uploadDTO = uploadService.memberImageOne(memberDTO);			
			} catch(Exception e) {
				uploadDTO = null;
			}
			
			if(uploadDTO != null)
			{
				uploadService.memberImageDelete(memberDTO.getMember_seq());
			}
		
			uploadDTO = new UploadDTO();
			uploadDTO.setMember_seq(memberDTO.getMember_seq());
			uploadDTO.setFile_name(fileSaver.fileSave(memberDTO.getFiles(), session, "upload"));
			uploadDTO.setOri_name(memberDTO.getFiles().getOriginalFilename());
			result = uploadService.memberImageUpdate(uploadDTO);
		}
		else//이미 있는 것을 유지 & 이미 있는데 삭제
		{
			try {
				uploadDTO = uploadService.memberImageOne(memberDTO);			
			} catch(Exception e) {
				uploadDTO = null;
			}
			
			if(uploadDTO != null && counting == 1)
			{
				uploadService.memberImageDelete(memberDTO.getMember_seq());
			}
		}
		
		if(result > 0)
		{
			message = "회원정보가 변경되었습니다. 다시 로그인 해주세요.";
			session.invalidate();
		}
		
		return message;
	}

//일반회원 아이디 찾기
	public List<MemberDTO> memberIdFind(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.memberIdFind(memberDTO);
	}
//일반회원 비밀번호 찾기
	public List<MemberDTO> memberPwFind(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.memberPwFind(memberDTO);
	}
//일반회원 임시비밀번호 업데이트
	public int memberPwFindUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.memberPwFindUpdate(memberDTO);
	}
//일반회원 -> 학생
	public int memberStudentUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.memberStudentUpdate(memberDTO);
	}
	
//state Update
	public int stateUpdate(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.stateUpate(memberDTO);
	}
	
//네이버 체크
	public MemberDTO naverIdCheck(String email) throws Exception {
			
		return memberDAO.naverIdCheck(email);
	}
//네이버 로그인
	public MemberDTO naverMemberLogin(HttpSession session, String id) throws Exception {
		
		MemberDTO memberDTO = memberDAO.naverMemberLogin(id);
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
	
//관리자 페이지
	public ModelAndView memberManagement(ModelAndView mv, ListData listData) throws Exception {
		
		
		if(listData.getKind().equals("회원명") || listData.getKind().equals("title"))
		{
			listData.setKind("name");
		}
		else if(listData.getKind().equals("아이디"))
		{
			listData.setKind("id");
		}
		else
		{
			listData.setKind("kind");
		}
		
		if(listData.getSearch().equals("일반회원"))
		{
			listData.setSearch("normal");
		}
		else if(listData.getSearch().equals("강사"))
		{
			listData.setSearch("teacher");
		}
		else if(listData.getSearch().equals("학생"))
		{
			listData.setSearch("student");
		}
		
		int totalCount = memberDAO.memberTotalCount();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(totalCount);
		
		List<MemberDTO> list = memberDAO.memberManagement(rowNum);
		
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		
		return mv;
	}
//관리자로 일반회원 삭제
	public String memberDelete(MemberDTO memberDTO) throws Exception {

		String message = "오류 : 삭제되지 않았습니다.";

		UploadDTO uploadDTO = null;

		try {
			uploadDTO = uploadService.memberImageOne(memberDTO);
		}catch(Exception e) {
			e.printStackTrace();
			uploadDTO = null;
		}

		int result = memberDAO.memberDelete(memberDTO.getMember_seq());

		if(memberDTO.getKind().equals("student"))
		{
			result = studentService.studentDelete(memberDTO.getMember_seq());
		}
		else if(memberDTO.getKind().equals("teacher"))
		{
			result = teacherService.teacherDelete(memberDTO.getMember_seq());
		}

		if(uploadDTO != null)
		{
			result = uploadService.memberImageDelete(memberDTO.getMember_seq());			
		}
		
		if(result > 0)
		{
			message = "삭제헀습니다.";
		}

		return message;
	}
//관리자로 일반회원 -> 강사
	public String memberTeacherUpdate(int member_seq) throws Exception {
		
		List<TeacherDTO> ar = teacherService.teacherSelectList();
		char temp = 'A';
		
		for(int i=0 ; i<ar.size() ; i++)
		{
			if(ar.size() - i == 1)
			{
				int third = (int)ar.get(ar.size()-1).getclassname().charAt(0) + 1;
				temp = (char)third;
				break;
			}
			
			int first = (int)ar.get(i).getclassname().charAt(0);
			int second = (int)ar.get(i+1).getclassname().charAt(0);
			
			if(second - first == 2)
			{
				first = (int)ar.get(i).getclassname().charAt(0);
				second = (int)ar.get(i+1).getclassname().charAt(0);
				temp = (char)((second + first) / 2);
				break;
			}
			else if(second - first != 1)
			{
				int third = (int)ar.get(i).getclassname().charAt(0) + 1;
				temp = (char)third;
				break;
			}
		}
		
		TeacherDTO teacherDTO = new TeacherDTO();
		
		teacherDTO.setMember_seq(member_seq);
		teacherDTO.setclassname(temp+"");
		
		int result = memberDAO.memberTeacherUpdate(member_seq);
		result = teacherService.teacherInsert(teacherDTO);
		String message = "변경 실패";
		
		if(result > 0)
		{
			message = "해당 회원을 강사로 변경하였습니다.";
		}
		
		return message;
	}
	
}

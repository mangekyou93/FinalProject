package com.fp.ctrl;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.member.MemberDTO;
import com.fp.member.MemberService;
import com.fp.upload.UploadDTO;
import com.fp.upload.UploadService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private UploadService uploadService;	

//일반회원 아이디 체크
	@RequestMapping(value="memberIdCheck")
	public ModelAndView memberIdCheck(String checkId, ModelAndView mv) throws Exception {
		String result = "";
		if(checkId.equals(""))
		{
			result = "아이디를 입력해주세요.";
		}
		else
		{
			result = memberService.memberIdCheck(checkId);			
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajax");
		
		return mv;
	}
	
//일반회원 회원가입 GET
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public ModelAndView memberJoin(MemberDTO memberDTO, ModelAndView mv) throws Exception {

		mv.addObject("menuTitle", "회원가입");
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
//일반회원 회원가입 POST
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
		
		rd = memberService.memberJoin(memberDTO, rd, session);	
		
		return "redirect:/";
	}
//일반회원 로그인	
	@RequestMapping(value="memberLogin")
	public String memberLogin(String logId, String logPw, HttpSession session, RedirectAttributes rd) {
		String message = "로그인 실패";
		MemberDTO memberDTO = new MemberDTO();
		UploadDTO uploadDTO = null;
		
		memberDTO.setId(logId);
		memberDTO.setPw(logPw);
		
		try {
			memberDTO = memberService.memberLogin(memberDTO);
			uploadDTO = uploadService.memberImageOne(memberDTO);
		} catch(Exception e) {
			memberDTO = null;
			uploadDTO = null;
			e.printStackTrace();
		}
		
		if(memberDTO != null)
		{
			session.setAttribute("member", memberDTO);
			message = "로그인 성공";
			
			if(uploadDTO != null)
			{
				session.setAttribute("profileImage", uploadDTO);
			}
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/";
	}
	
//로그아웃
	@RequestMapping(value="memberLogout")
	public String logout(RedirectAttributes rd, HttpSession session) throws Exception {
		
		int result = memberService.stateUpdate((MemberDTO)session.getAttribute("member"));
		
		if(result > 0)
		{
			rd.addFlashAttribute("message", "로그아웃 되었습니다.");
			session.invalidate();
		}
		else
		{
			rd.addFlashAttribute("message", "로그아웃 실패");
		}
		
		return "redirect:/";
	}
	
//마이페이지
	@RequestMapping(value="memberMypage")
	public ModelAndView memberMypage(ModelAndView mv, HttpSession session) throws Exception {
		
		mv.addObject("menuTitle", "회원정보");
		mv.setViewName("member/memberMypage");
		
		return mv;
	}
//일반회원 수정 및 삭제 비번 체크 GET
	@RequestMapping(value="memberCheck", method=RequestMethod.GET)
	public ModelAndView memberPwCheck(ModelAndView mv, String select) throws Exception {
		
		if(select.equals("update"))
		{
			mv.addObject("menuTitle", "정보수정");			
		}
		else
		{
			mv.addObject("menuTitle", "회원탈퇴");	
		}
		
		mv.setViewName("member/memberCheck");
		
		return mv;
	}
//일반회원 수정 및 삭제 비번 체크 POST
	@RequestMapping(value="memberCheck", method=RequestMethod.POST)
	public String memberPwCheck(String checkId, String checkPw, String menuTitle, RedirectAttributes rd, HttpSession session) throws Exception {
		
		String path = "";
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(memberDTO.getId().equals(checkId) && memberDTO.getPw().equals(checkPw))
		{
			if(menuTitle.equals("회원탈퇴"))
			{
				path = "redirect:./memberDelete";
			}
			else
			{
				path = "redirect:./memberUpdate";
			}
		}
		else
		{
			System.out.println("틀렸다");
			rd.addFlashAttribute("message", "아이디와 비밀번호를 확인한 후 다시한번 입력해 주세요.");
			if(menuTitle.equals("회원탈퇴"))
			{
				path = "redirect:./memberCheck?select=delete";				
			}
			else
			{
				path = "redirect:./memberCheck?select=update";	
			}
		}
		
		return path;
	}
	
//일반회원 탈퇴
	@RequestMapping(value="memberDelete")
	public String memberDelete(HttpSession session, RedirectAttributes rd) throws Exception {
		
		String message = memberService.memberDelete(session);
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/";
	}

//일반회원 수정 GET
	@RequestMapping(value="memberUpdate", method=RequestMethod.GET)
	public ModelAndView memberUpdate(ModelAndView mv, HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		UploadDTO uploadDTO = (UploadDTO)session.getAttribute("profileImage");
		
		String[] ages = memberDTO.getAge().split("-");
		mv.addObject("age", ages);
		
		String[] emails = memberDTO.getEmail().split("@");
		mv.addObject("email", emails);
		
		String[] phones = memberDTO.getPhone().split("-");
		mv.addObject("phone", phones);

		String[] addresses = memberDTO.getAddress().split("/");
		mv.addObject("address", addresses);
		
		mv.addObject("menuTitle", "정보수정");
		mv.setViewName("member/memberUpdate");
		
		return mv;
		
	}
//일반회원 비밀번호 수정 POST
	@RequestMapping(value="memberPwUpdate", method=RequestMethod.POST)
	public String memberUpdate(HttpSession session, String currPw, String newPw, String newPwCheck, RedirectAttributes rd) throws Exception {
		
		String message = "비밀번호가 변경되었습니다. 다시 로그인 해주세요.";
		String path = "redirect:./memberUpdate";
		
		System.out.println(((MemberDTO)session.getAttribute("member")).getPw());
		System.out.println(currPw);
		
		if(currPw.equals(newPw))
		{
			message = "현재 비밀번호와 변경하실 비밀번호가 일치합니다. 다르게 입력해주세요.";
		}
		else if(!newPw.equals(newPwCheck))
		{
			message = "변경하실 비밀번호와 비밀번호 확인이 서로 다릅니다. 다시한번 입력해주세요.";
		}
		else if(!((MemberDTO)session.getAttribute("member")).getPw().equals(currPw))
		{
			message = "현재 비밀번호가 틀렸습니다, 다시한번 입력해주세요.";			
		}
		else
		{
			path = memberService.memberPwUpdate(session, newPw);
		}
		
		rd.addFlashAttribute("message", message);
		
		return path;
	}
//일반회원 정보 수정 POST
	@RequestMapping(value="memberInfoUpdate", method=RequestMethod.POST)
	public String memberUpdate(HttpSession session, MemberDTO memberDTO, RedirectAttributes rd) throws Exception {

		
		String message = memberService.memberInfoUpdate(session, memberDTO);
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/";
	}
	
//네이버 체크	
	@RequestMapping(value="memberCheck")
	public void naverIdCheck(MemberDTO memberDTO) throws Exception {
		MemberDTO cMember = null;

		cMember = memberService.naverIdCheck(memberDTO.getEmail());

	}

//이용약관 및 개인정보취급방침
	@RequestMapping(value="memberAgree")
	public ModelAndView memberAgree(ModelAndView mv) throws Exception {
		
		mv.addObject("menuTitle", "이용약관 및 개인정보취급방침");
		mv.setViewName("member/memberAgree");
		
		return mv;
	}

}


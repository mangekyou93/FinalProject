package com.fp.ctrl;

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
public class MemberController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private UploadService uploadService;	

//일반 아이디 체크
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
	
//일반 회원가입 GET
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public ModelAndView memberJoin(MemberDTO memberDTO, ModelAndView mv) throws Exception {

		mv.addObject("menuTitle", "회원가입");
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
//일반 회원가입 POST
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, RedirectAttributes rd, HttpSession session) throws Exception {
		
		rd = memberService.memberJoin(memberDTO, rd, session);	
		
		return "redirect:/";
	}
//일반 로그인	
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
	
//네이버 체크	
	@RequestMapping(value="memberCheck")
	public void naverIdCheck(MemberDTO memberDTO) throws Exception {
		MemberDTO cMember = null;
		
		cMember = memberService.naverIdCheck(memberDTO.getEmail());
		
	}
	
//마이페이지
	@RequestMapping(value="memberMypage")
	public ModelAndView memberMypage(ModelAndView mv, HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		UploadDTO uploadDTO = (UploadDTO)session.getAttribute("profileImage");
		
		mv.addObject("member", memberDTO);
		mv.addObject("profileImage", uploadDTO);
		mv.addObject("menuTitle", "회원정보");
		mv.setViewName("member/memberMypage");
		
		return mv;
	}
	
//이용약관 및 개인정보취급방침
	@RequestMapping(value="memberAgree")
	public ModelAndView memberAgree(ModelAndView mv) throws Exception {
		
		mv.addObject("menuTitle", "이용약관 및 개인정보취급방침");
		mv.setViewName("member/memberAgree");
		
		return mv;
	}
}

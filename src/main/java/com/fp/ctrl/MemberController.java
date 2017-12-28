package com.fp.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.member.MemberDTO;
import com.fp.member.MemberService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public String join(MemberDTO memberDTO) throws Exception {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public void join(MemberDTO memberDTO, RedirectAttributes rd) {
		
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPw());
		System.out.println(memberDTO.getName());
		System.out.println(memberDTO.getPhone());
		System.out.println(memberDTO.getEmail());
		System.out.println(memberDTO.getAge());
		System.out.println(memberDTO.getAddress());
	}
	
	@RequestMapping(value="memberLogin")
	public void login(MemberDTO memberDTO) {
		
		
		
	}
	
	@RequestMapping(value="memberCheck")
	public void memberCheck(MemberDTO memberDTO) throws Exception {
		MemberDTO cMember = null;
		
		cMember = memberService.memberCheck(memberDTO.getEmail());
		
		if(cMember == null)
		{
			this.join(memberDTO);
		}
		else
		{
			this.login(memberDTO);
		}
	}
	
}

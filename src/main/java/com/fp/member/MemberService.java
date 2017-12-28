package com.fp.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

//로그인
	public void login() throws Exception {
		
	}
	
//네이버 체크	
	public MemberDTO memberCheck(String email) throws Exception {
		
		return memberDAO.memberCheck(email);
	}

}

package com.fp.teacher;

import com.fp.member.MemberDTO;

public class TeacherDTO extends MemberDTO{
	
	private int member_seq;
	private String classname;
	private String career;
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getclassname() {
		return classname;
	}
	public void setclassname(String classname) {
		this.classname = classname;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	
	
}

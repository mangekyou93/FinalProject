package com.fp.teacher;

import com.fp.member.MemberDTO;

public class TeacherDTO extends MemberDTO{

	private String className;
	private String career;
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	
	
}

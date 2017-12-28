package com.fp.student;

import com.fp.member.MemberDTO;

public class StudentDTO extends MemberDTO {


	private String className;
	

	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}

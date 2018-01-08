package com.fp.member;

import org.springframework.web.multipart.MultipartFile;

import com.fp.upload.UploadDTO;

public class MemberDTO extends UploadDTO {

	private int member_seq;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String age;
	private String address;
	private String kind;
	private int state;
	private MultipartFile files;
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public MultipartFile getFiles() {
		return files;
	}
	public void setFiles(MultipartFile files) {
		this.files = files;
	}
	
}

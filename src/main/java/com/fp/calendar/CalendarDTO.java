package com.fp.calendar;

public class CalendarDTO {

	private int calendar_num;
	private int member_seq;
	private String id;
	private String cal_title;
	private String cal_contents;
	private String date_start;
	private String date_end;
	public int getCalendar_num() {
		return calendar_num;
	}
	public void setCalendar_num(int calendar_num) {
		this.calendar_num = calendar_num;
	}
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
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_contents() {
		return cal_contents;
	}
	public void setCal_contents(String cal_contents) {
		this.cal_contents = cal_contents;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	
	
	
}

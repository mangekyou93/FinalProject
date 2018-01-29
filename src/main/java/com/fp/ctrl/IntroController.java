package com.fp.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.member.MemberDTO;
import com.fp.member.MemberService;
import com.fp.teacher.TeacherDTO;
import com.fp.teacher.TeacherService;
import com.fp.upload.UploadDTO;
import com.fp.upload.UploadService;

@Controller
@RequestMapping(value="/intro/*")
public class IntroController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private TeacherService teacherService;
	@Inject
	private UploadService uploadService;
	
//강사 소개	
	@RequestMapping(value="teacherIntro")
	public ModelAndView teacherIntro(ModelAndView mv) throws Exception {
		
		List<TeacherDTO> teacherList = teacherService.teacherSelectList();
		int i = 0;
		for(TeacherDTO teacherDTO : teacherList)
		{
			
			//멤버 불러오기
			MemberDTO memberDTO = memberService.selectOne(teacherDTO.getMember_seq());
			teacherList.get(i).setName(memberDTO.getName());
			teacherList.get(i).setPhone(memberDTO.getPhone());
			teacherList.get(i).setEmail(memberDTO.getEmail());
			teacherList.get(i).setAge(memberDTO.getAge());
			teacherList.get(i).setAddress(memberDTO.getAddress());
			teacherList.get(i).setKind(memberDTO.getKind());
			
			//이미지불러오기
			UploadDTO uploadDTO = uploadService.memberImageOne(memberDTO);
			teacherList.get(i).setFile_seq(uploadDTO.getFile_seq());
			teacherList.get(i).setFile_name(uploadDTO.getFile_name());
			teacherList.get(i).setOri_name(uploadDTO.getOri_name());

			i++;
		}
		
		mv.addObject("teachers", teacherList);
		mv.addObject("menuTitle", "강사소개");
		mv.setViewName("intro/teacherIntro");
		
		return mv;
	}
//찾아오시는 길
	@RequestMapping(value="roadIntro")
	public ModelAndView roadIntro(ModelAndView mv) throws Exception {
		
		mv.addObject("menuTitle", "찾아오시는 길");
		mv.setViewName("intro/roadIntro");
		
		return mv;
	}
	
}

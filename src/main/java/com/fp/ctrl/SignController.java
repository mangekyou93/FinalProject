package com.fp.ctrl;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.calendar.CalendarDAO;
import com.fp.calendar.CalendarDTO;
import com.fp.calendar.CalendarService;
import com.fp.member.MemberDTO;
import com.fp.member.MemberService;
import com.fp.sign.SignDTO;
import com.fp.sign.SignService;
import com.fp.student.StudentDTO;
import com.fp.student.StudentService;

@Controller
@RequestMapping(value="/sign/*")
public class SignController {

	@Inject
	private SignService signService;
	@Inject
	private CalendarService calednarService;
	@Inject
	private CalendarDAO calendarDAO;
	@Inject
	private MemberService memberService;
	@Inject
	private StudentService studentService;
	
	//모델로 받아서 가지고 오도록
	/*@RequestMapping(value="sign_apply", method = RequestMethod.GET)
	public ModelAndView selectOne1(ModelAndView mv, int id, RedirectAttributes rd)throws Exception{
		CalendarDTO calendarDTO = calednarService.selectOne(id);
		if(calendarDTO != null){
			mv.addObject("cview", calendarDTO);
			mv.addObject("menuTitle", "커리큘럼 수강신청");
			mv.setViewName("sign/sign_view");
		}else{
			rd.addFlashAttribute("message", "에러");
			mv.setViewName("redirect:../../calendar");
		}
		return mv;
	}*/
	
	//
	@RequestMapping(value="sign_apply", method=RequestMethod.GET)
	public String insert(Model model)throws Exception{
		
		List<CalendarDTO> ar = calendarDAO.selectList();
		
		model.addAttribute("menuTitle", "수강신청");
		model.addAttribute("list", ar);
		
		return "sign/sign";
	}
	
	
	@RequestMapping(value="sign_apply", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, SignDTO signDTO, HttpSession session, String classname)throws Exception{
		int result = signService.insert(signDTO, session);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		result = memberService.memberStudentUpdate(memberDTO);
		
		StudentDTO studentDTO = new StudentDTO();
		studentDTO.setMember_seq(memberDTO.getMember_seq());
		studentDTO.setClassname(classname);
		
		result = studentService.studentInsert(studentDTO);
		
		String message="no";
		if(result>0){
			message="yes";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:../calendar/test";
	}
	
	@RequestMapping(value="sign_view", method=RequestMethod.GET)
	public ModelAndView selectOne(ModelAndView mv, int sid, RedirectAttributes rd)throws Exception{
		SignDTO signDTO = signService.selectOne(sid);
		
		if(signDTO != null)
		{
			mv.addObject("sview", signDTO);
			mv.setViewName("sign/sign_apply");
		}else{
			mv.setViewName("redirect:../../calendar");
		}
		return mv;
	}
	
	@RequestMapping(value="sign_list")
	public ModelAndView selectList(ModelAndView mv)throws Exception{
		mv=signService.selectList();
		return mv;
	}
	
	
}
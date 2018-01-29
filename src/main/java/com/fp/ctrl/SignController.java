package com.fp.ctrl;

import java.lang.ProcessBuilder.Redirect;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.calendar.CalendarDTO;
import com.fp.calendar.CalendarService;
import com.fp.sign.SignDTO;
import com.fp.sign.SignService;

@Controller
@RequestMapping(value="/sign/*")
public class SignController {

	@Inject
	private SignService signService;
	@Inject
	private CalendarService calednarService;
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
		model.addAttribute("menuTitle", "수강신청");
		return "sign/sign";
	}
	
	
	@RequestMapping(value="sign_apply", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, SignDTO signDTO, HttpSession session)throws Exception{
		int result = signService.insert(signDTO, session);
		String message="no";
		if(result>0){
			message="yes";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:../calendar/test";
	}
	@RequestMapping(value="sign_view", method=RequestMethod.GET)
	public ModelAndView selectOne(ModelAndView mv, int sid, int id, RedirectAttributes rd)throws Exception{
		SignDTO signDTO = signService.selectOne(sid);
		CalendarDTO calendarDTO = calednarService.selectOne(id);
		if(signDTO != null)
		{
			mv.addObject("view", calendarDTO);
			mv.addObject("sview", signDTO);
			mv.setViewName("sign/sign_apply");
			/*mv.setViewName("sign/sign_view");*/
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
package com.fp.ctrl;

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


	@RequestMapping(value="sign_apply", method=RequestMethod.GET)
	public String insert(Model model)throws Exception{
		System.out.println("겟까지 왔음");
		return "sign/sign";
	}
	
	@RequestMapping(value="sign_apply", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, SignDTO signDTO, HttpSession session)throws Exception{
	
		int result = signService.insert(signDTO, session);
		System.out.println("포스트 까지 왔음");
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
		System.out.println(signDTO.getClassname());
		
		if(signDTO != null)
		{
			mv.addObject("sview", signDTO);
			mv.setViewName("sign/sign_view");
		}
		else
		{
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
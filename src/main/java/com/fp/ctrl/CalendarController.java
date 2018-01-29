package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.calendar.CalendarDTO;
import com.fp.calendar.CalendarService;

@Controller
@RequestMapping(value="/calendar/*")
public class CalendarController {

	@Inject
	private CalendarService calendarService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
    public ModelAndView calendarList(ModelAndView mv)throws Exception{
		mv = calendarService.selectList();
		mv.setViewName("list");
		mv.setViewName("data");
		mv.addObject("menuTitle", "커리큘럼");
		mv.setViewName("calendar/calendar");
		return mv;
	}
	
	
	@RequestMapping(value="calendar_list")
	public ModelAndView selectList(ModelAndView mv)throws Exception{
		mv = calendarService.selectList();
		return mv;
	}
	@RequestMapping(value="calendarSelectOne", method=RequestMethod.POST)
	@ResponseBody
	public CalendarDTO selectOne(int id) throws Exception {
		
		CalendarDTO calendarDTO = calendarService.selectOne(id);
		
		return calendarDTO;
	}
	
	
	//calendar_view
	@RequestMapping(value="calendar_view", method = RequestMethod.GET)
	public ModelAndView selectOne(ModelAndView mv, int id, RedirectAttributes rd)throws Exception{
		CalendarDTO calendarDTO = calendarService.selectOne(id);
		if(calendarDTO != null){
			mv.addObject("view", calendarDTO);
			mv.addObject("viewTitle", "커리큘럼 내용");
			mv.setViewName("calendar/calendar_view");
		}else{
			rd.addFlashAttribute("message", "에러");
			/*mv.setViewName("redirect:../../calendar");*/
		}
		return mv;
	}
	//insert --> form �̵�
	@RequestMapping(value="calendar_write", method=RequestMethod.GET)
	public String insert(Model model)throws Exception{
		model.addAttribute("cal", "calendar");
		return "calendar/calendar_write";
	}
	//insert --> DB ó��
	@RequestMapping(value="calendar_write", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, CalendarDTO calendarDTO)throws Exception{
		int result = calendarService.insert(calendarDTO);
		
		String message="추가하지 못했습니다.";
		if(result>0){
			message = "추가했습니다.";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:../calendar/test";
	}
	
	//update --> form �̵�
	@RequestMapping(value="calendar_update",method=RequestMethod.GET)
	public String update(Model model, int id)throws Exception{
		CalendarDTO calendarDTO = calendarService.selectOne(id);
		
		model.addAttribute("view", calendarDTO);
		return "calendar/calendar_update";
	}
	
	//update --> DB ó��
	@RequestMapping(value="calendar_update", method=RequestMethod.POST)

	public String update(CalendarDTO calendarDTO, RedirectAttributes rd)throws Exception{
		int result = calendarService.update(calendarDTO);
		
		String message = "업데이트 실패";
		if(result > 0){
			message = "업데이트 성공";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:../calendar/test";
	}
	//delete
	@RequestMapping(value="calendarDelete")
	/*@ResponseBody*/
	public String delete(int id, RedirectAttributes rd)throws Exception{
		int result = calendarService.delete(id);
		
		String message = "삭제 실패";
		if(result > 0){
			message = "삭제 성공";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:../calendar/test";
	}
	
	
	
}

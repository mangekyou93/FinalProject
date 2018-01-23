package com.fp.calendar;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

@Service
public class CalendarService {

	@Inject
	private CalendarDAO calendarDAO;
	
	/*public ModelAndView selectList2(ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(calendarDAO.totalCount(rowNum));
		List<calendarDTO> ar = calendarDAO.selectList2(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("calendar/calendar_list");
		return mv;
	}*/
	public ModelAndView selectList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CalendarDTO> ar = calendarDAO.selectList();
		CalendarDTO calendarDTO = new CalendarDTO();
		
		calendarDTO.setNum(calendarDTO.getNum());
		calendarDTO.setTitle(calendarDTO.getTitle());
		calendarDTO.setContents(calendarDTO.getContents());
		calendarDTO.setDate_start(calendarDTO.getDate_start());
		calendarDTO.setDate_end(calendarDTO.getDate_end());
		calendarDTO.setClassname(calendarDTO.getClassname());
		calendarDTO.setId(calendarDTO.getId());
		String js = "[";
		String str ="";
		for(CalendarDTO c : ar){
			  str = "{\"id\":\""+c.getId()+"\",";
	           str=str+"\"title\":\""+c.getTitle()+"\",";
	           str=str+"\"contents\":\""+c.getContents()+"\",";
	           str=str+"\"start\":\""+c.getDate_start()+"\",";
	           str=str+"\"end\":\""+c.getDate_end()+"\",";
	           str=str+"\"className\":\""+c.getClassname()+"\"}";
	        
	              js=js+str+",";
		}
		js=js+str+"]";
		
		
		mv.addObject("data",js);
		mv.addObject("list", ar);
		mv.setViewName("calendar/event");
		return mv;
	}
	
	
	
	public CalendarDTO selectOne(int id)throws Exception{
		CalendarDTO calendarDTO = calendarDAO.selectOne(id);
		return calendarDTO;
	}
	
	@Transactional
	public int insert(CalendarDTO calendarDTO)throws Exception{
		int result = calendarDAO.insert(calendarDTO);
		/*Map<String, Object> map = new HashMap<String, Object>();*/
		
		return result;
	}
	
	public int update(CalendarDTO calendarDTO)throws Exception{
		int result = calendarDAO.update(calendarDTO);
		return result;
	}
	public int delete(int id)throws Exception{
		int result = calendarDAO.delete(id);
		return result;
	}
	
}

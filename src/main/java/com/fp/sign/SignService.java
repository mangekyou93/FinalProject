package com.fp.sign;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.fp.calendar.CalendarDAO;
import com.fp.calendar.CalendarDTO;
@Service
public class SignService {

	@Inject
	private SignDAO signDAO;
	
	@Inject
	private CalendarDAO calendarDAO;
	
	@Transactional
	public int insert(SignDTO signDTO, HttpSession session)throws Exception{
		int result = signDAO.insert(signDTO);
		return result;
	}
	
	public SignDTO selectOne(int sid)throws Exception{
		SignDTO signDTO = signDAO.selectOne(sid);
		return signDTO;
	}
	
	public ModelAndView selectList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<SignDTO> ar = signDAO.selectList();
		mv.addObject("slist", ar);
		mv.setViewName("./sign/sign_list");
		return mv;
	}
	
}

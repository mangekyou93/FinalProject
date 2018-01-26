package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fp.qna.QnaService;

@Controller
@RequestMapping(value="board/qna/*")
public class QnaController {

	@Inject
	QnaService qnaService;
	
	@RequestMapping(value="qnaList")
	public void selectList() throws Exception {
		
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv) throws Exception {
		
		mv.addObject("menuTitle", "질문하기");
		mv.setViewName("board/qna/qnaWrite");
		
		return mv;
		
	}
}

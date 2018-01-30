package com.fp.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.board.BoardDTO;
import com.fp.reply.ReplyDTO;
import com.fp.reply.ReplyService;

@Controller
@RequestMapping(value="/reply/*")
public class ReplyController {

	@Inject
	ReplyService replyService;
	
	@RequestMapping(value="freeboardreplyInsert", method=RequestMethod.POST)
	public ModelAndView freeboardreplyInsert(ReplyDTO replyDTO, HttpSession session, ModelAndView mv) {
		int result = 0;
		List<ReplyDTO> ar = new ArrayList<ReplyDTO>();
		try {
			result = replyService.freeboardInsert(replyDTO);
			 ar = replyService.freeboardList(replyDTO.getBoard_seq());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "작성 실패";
		if(result>0){
			message = "작성 성공";
		}
		
		mv.addObject("replyList", ar);
		mv.setViewName("common/replyResult");
		
		return mv;
	}
	
	@RequestMapping(value="freeboardReply", method=RequestMethod.POST)
	public ModelAndView freeboardReply(ReplyDTO replyDTO, ModelAndView mv) {
		
		List<ReplyDTO> ar = new ArrayList<ReplyDTO>();
		try {
			replyService.update(replyDTO);
			 ar = replyService.freeboardList(replyDTO.getBoard_seq());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("replyList", ar);
		mv.setViewName("common/replyResult");
		return mv;
	}
	
}

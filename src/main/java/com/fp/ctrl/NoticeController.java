package com.fp.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.util.ListData;
import com.fp.board.BoardDTO;
import com.fp.member.MemberDTO;
import com.fp.notice.NoticeDTO;
import com.fp.notice.NoticeService;
import com.fp.reply.ReplyDAO;
import com.fp.reply.ReplyDTO;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@Inject
	NoticeService noticeService;
	@Inject
	ReplyDAO replyDAO;

	//게시판 리스트 
		@RequestMapping(value="freeboard")
		public ModelAndView freeboard(ModelAndView mv, ListData listData, HttpSession session) {
			
			if(session.getAttribute("member") != null){
				MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
				mv.addObject("member", memberDTO);
			}
			
			System.out.println("IN");
			
			if(listData.getKind()==""){
				listData.setKind("title");
			}
			if(listData.getCurPage()==0){
				listData.setCurPage(1);
			}
			try {
				noticeService.selectList(listData, mv);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/boardList");
			return mv;
		}
		
		
		//게시판 작성 폼 이동
		@RequestMapping(value="freeboardInsert")
		public ModelAndView freeboardInsert(ModelAndView mv, HttpSession session) {
			if(session.getAttribute("member") != null){
				MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
				mv.addObject("member", memberDTO);
			}
			mv.addObject("menuTitle", "게시글 작성");
			mv.setViewName("board/boardInsertForm");
			return mv;
		}
		//게시판 작성 실제 처리
		@RequestMapping(value="freeboardInsert", method=RequestMethod.POST) 
		public String freeboardInsert(RedirectAttributes rd, HttpSession session, BoardDTO boardDTO, HttpServletRequest request) {
			System.out.println("writer"+boardDTO.getWriter());
			int result = 0;
			String message = "작성실패";
			try {
				result = noticeService.insert(boardDTO);
				if(result>0) {
					message="작성성공";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd.addFlashAttribute("message", message);
			return "redirect:./freeboard";
		}
		//게시판 뷰
		@RequestMapping(value="boardOne")
		public ModelAndView freeboardOne(int board_seq, ModelAndView mv, HttpSession session) {
			BoardDTO noticeDTO = new NoticeDTO();
			List<ReplyDTO> ar = null;
			if(session.getAttribute("member") != null){
				MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
				mv.addObject("member", memberDTO);
			}
			
			try {
				noticeDTO = noticeService.selectOne(board_seq);
				System.out.println("seq : "+board_seq);
				ar = replyDAO.selectList(board_seq);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("view", noticeDTO).addObject("menuTitle", "자유게시판").addObject("list", ar);
			mv.setViewName("board/boardView");
			return mv;
		}
}

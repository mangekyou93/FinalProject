package com.fp.notice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fp.board.BoardDTO;
import com.fp.board.BoardService;
import com.fp.reply.ReplyDAO;
import com.fp.util.ListData;
import com.fp.util.Pager;
import com.fp.util.RowNum;

@Service
public class NoticeService implements BoardService{

	@Inject
	NoticeDAO noticeDAO;
	
	public int insert(BoardDTO boardDTO) throws Exception {
		return noticeDAO.insert(boardDTO);
	}
	
	@Override
	public ModelAndView selectList(ListData listData,ModelAndView mv) throws Exception {
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		ar = noticeDAO.selectList(rowNum);
		
		mv.addObject("pager", pager).addObject("list", ar).addObject("total", totalCount).addObject("listData", listData).addObject("menuTitle", "자유게시판");
		return mv;
	}

	@Override
	public BoardDTO selectOne(int board_seq) throws Exception {
		return noticeDAO.selectOne(board_seq);
	}

	@Override
	public int insert(BoardDTO boardDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

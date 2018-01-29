package com.fp.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fp.board.BoardDTO;
import com.fp.board.BoardService;
import com.fp.util.ListData;

@Service
public class ReplyService implements BoardService{

	@Inject
	ReplyDAO replyDAO;
	
	@Override
	public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception {
		return null;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
	public int delete(int board_seq) throws Exception {
		return replyDAO.replyDelete(board_seq);
	}
	
	public int freeboardInsert(ReplyDTO replyDTO) throws Exception {
		int reply_seq = replyDAO.reply_seq();
		replyDTO.setReply_seq(reply_seq);
		replyDTO.setRef(reply_seq);
		return replyDAO.freeboardInsert(replyDTO);
	}
	
	public List<ReplyDTO> freeboardList(int board_seq) throws Exception {
		return replyDAO.selectList(board_seq);
	}
}

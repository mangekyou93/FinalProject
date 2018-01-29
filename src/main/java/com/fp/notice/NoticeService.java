package com.fp.notice;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fp.board.BoardDTO;
import com.fp.board.BoardService;
import com.fp.reply.ReplyDAO;
import com.fp.upload.UploadDAO;
import com.fp.upload.UploadDTO;
import com.fp.util.ListData;
import com.fp.util.Pager;
import com.fp.util.RowNum;

@Service
public class NoticeService implements BoardService{

	@Inject
	NoticeDAO noticeDAO;
	@Inject
	UploadDAO uploadDAO;
	@Inject
	ReplyDAO replyDAO;
	
	public int insert(BoardDTO boardDTO, String[] oriName) throws Exception {
		UploadDTO uploadDTO = null;
		
		int board_seq = noticeDAO.select_board_seq();
		for(int i=0; i<oriName.length; i++){
			uploadDTO = new UploadDTO();
			uploadDTO.setBoard_seq(board_seq);
			uploadDTO.setOri_name(oriName[i]);
			oriName[i] = oriName[i].substring(oriName[i].lastIndexOf("#")+1);
			uploadDTO.setFile_name(oriName[i]);
			uploadDTO.setMember_seq(boardDTO.getMember_seq());
			uploadDAO.noticeInsert(uploadDTO);
		}
		boardDTO.setBoard_seq(board_seq);
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
	public int delete(int board_seq) throws Exception {
		return 0;
	}
	
	public int delete(int board_seq,HttpSession session) throws Exception {
		List<UploadDTO> ar = uploadDAO.noticeSelect(board_seq);
		for(int i=0; i<ar.size(); i++){
			String path = session.getServletContext().getRealPath("resources/upload/"+ar.get(i).getOri_name());
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
		}
		replyDAO.replyDelete(board_seq);
		uploadDAO.noticeDelete(board_seq);
		return noticeDAO.delete(board_seq);
	}

}

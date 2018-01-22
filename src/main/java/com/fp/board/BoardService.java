package com.fp.board;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.fp.util.ListData;


public interface BoardService {

		//selectList
		public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception;
		
		//selectOne
		public BoardDTO selectOne(int num) throws Exception;
		
		//insert
		public int insert(BoardDTO boardDTO, HttpSession session) throws Exception;
		
		//update
		public int update(BoardDTO boardDTO) throws Exception;
		
		//delete
		public int delete(int num) throws Exception;
}

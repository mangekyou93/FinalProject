package com.fp.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.board.BoardDAO;
import com.fp.board.BoardDTO;
import com.fp.util.RowNum;

@Repository
public class NoticeDAO implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "noticeMapper.";
	
	@Override
	public List<BoardDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
	}

	@Override
	public BoardDTO selectOne(int board_seq) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", board_seq);
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", boardDTO);
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

	@Override
	public int totalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", rowNum);
	}

	@Override
	public int hitUpdate(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

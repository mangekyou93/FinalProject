package com.fp.reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "replyMapper.";
	
	
	public int freeboardInsert(ReplyDTO replyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"freeboardReplyInsert", replyDTO);
	}
	
	
	public List<ReplyDTO> selectList(int board_seq) throws Exception {
		System.out.println(board_seq);
		return sqlSession.selectList(NAMESPACE+"replyList", board_seq);
	}

	public int reply_seq() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"reply_seq");
	}
	
	public int replyDelete(int board_seq) throws Exception {
		return sqlSession.delete(NAMESPACE+"replyDelete", board_seq);
	}
	
	public int reply_reply(ReplyDTO replyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"reply_reply", replyDTO);
	}
	
	public int stepUpdate(ReplyDTO replyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"stepUpdate", replyDTO);
	}
}

package com.fp.sign;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fp.calendar.CalendarDTO;

@Repository
public class SignDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "signMapper.";
	
	
	public int insert(SignDTO signDTO)throws Exception{

		int result = sqlSession.insert(namespace+"insert", signDTO);
		return result;
	}
	public SignDTO selectOne(int sid)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne",sid);
	}
	
	public List<SignDTO> selectList()throws Exception{
		return sqlSession.selectList(namespace+"selectList");
	}
	
}

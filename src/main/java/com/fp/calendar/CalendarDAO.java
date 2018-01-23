package com.fp.calendar;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "calendarMapper.";

	
	public List<CalendarDTO> selectList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public CalendarDTO selectOne(int id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
	
	public int insert(CalendarDTO calendarDTO)throws Exception{
		int result = sqlSession.insert(NAMESPACE+"insert", calendarDTO);
		return result;
	}
	
	public int update(CalendarDTO calendarDTO)throws Exception{
		return  sqlSession.update(NAMESPACE+"update", calendarDTO);
	}
	
	public int delete(int id)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", id);
	}
}

package com.fp.calendar;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "calendarMapper.";

}

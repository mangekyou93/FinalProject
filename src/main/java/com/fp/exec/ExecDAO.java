package com.fp.exec;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.util.RowNum;

@Repository
public class ExecDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace="execMapper.";
	
	public List<ExecDTO> selectList(RowNum rowNum){
		return sqlSession.selectList(namespace+"selectList",rowNum);
	}

	public ExecDTO selectOne(int num){
		return sqlSession.selectOne(namespace+"selectOne",num);
	}
	
	public int update(ExecDTO execDTO) {
		return sqlSession.update(namespace+"update", execDTO);
		
	}
	public int insert(ExecDTO execDTO){
		return sqlSession.insert(namespace+"insert",execDTO);
	}
	
	public int delete(int num){
		return sqlSession.delete(namespace+"delete",num);
	}
	
	public int totalCount(RowNum rowNum){
		int result=0;
		
		try{
			result= sqlSession.selectOne(namespace+"totalCount",rowNum);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return result;
		
	}
	
	public String selectResult(int num){
		return sqlSession.selectOne(namespace+"selectResult",num);
	}
	
	
	/*public int deleteAll(String str){
		return 0;
	}*/

}

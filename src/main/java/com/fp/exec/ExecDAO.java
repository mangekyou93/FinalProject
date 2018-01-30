package com.fp.exec;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.util.RowNum;

@Repository
public class ExecDAO {

   @Autowired
   private SqlSession sqlSession;
   private static final String namespace="execMapper.";


   public List<Integer> selectNum(int member_seq){
      return sqlSession.selectList(namespace+"selectNum",member_seq);
   } 
   
   public List<ExecDTO> selectList(RowNum rowNum ,String list){
      Map<String, Object> map  = new HashMap<String , Object>();
      map.put("rowNum", rowNum);
      if(list!=null){
         map.put("quizLevel", list);
      }
      else{
         map.put("quizLevel", "Level");
      }
      return sqlSession.selectList(namespace+"selectList",map);
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
   public int insertSuc(int num , int member_seq){
      Map<String, Integer> map =new HashMap<String , Integer>();
      map.put("num", num);
      map.put("member_seq", member_seq);
      return sqlSession.insert(namespace+"insertSuc",map);
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



}
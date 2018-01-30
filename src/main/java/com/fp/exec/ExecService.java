package com.fp.exec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fp.util.ListData;
import com.fp.util.Pager;
import com.fp.util.RowNum;


@Service
public class ExecService {

   @Autowired
   private ExecDAO execDAO;

   

   public ModelAndView selectList(ListData listData, String list , int member_seq)throws Exception{
      ModelAndView mv = new ModelAndView();
      
      List<Integer> listNum=execDAO.selectNum(member_seq);
      
      listData.setPerPage(10);
      RowNum rowNum = listData.makeRow();
      System.out.println("test : "+execDAO.totalCount(rowNum));

      Pager pager =listData.makePage(execDAO.totalCount(rowNum));
      List<ExecDTO> ar=null; 
      try{
         ar=execDAO.selectList(rowNum,list);
      }catch (Exception e) {
         e.printStackTrace();
         // TODO: handle exception
      }
      
      mv.addObject("page", pager);
      mv.addObject("list", ar);
      mv.addObject("listNum", listNum);
      mv.addObject("level", list);
      mv.addObject("listNum_length", listNum.size());

      mv.setViewName("quiz/quizList");
      return mv;
   }

   public ExecDTO selectOne(int num){
      ExecDTO execDTO =execDAO.selectOne(num);

      return execDTO;
   }

   public int update(ExecDTO execDTO) {
      int result =execDAO.update(execDTO);
      return result;
   }

   public int insert(ExecDTO execDTO){
      int result=0;

      try{
         result=execDAO.insert(execDTO);
      }catch (Exception e) {
         e.printStackTrace();
         // TODO: handle exception
      }
      return result;

   }
   public int insertSuc(int num , int member_seq){
      int result=0;
      
      try{
         result=execDAO.insertSuc(num,member_seq);
      }catch (Exception e) {
         
         // TODO: handle exception
      }
      return result;
   }
   public int delete(int num){
      int result=0;

      try{
         result=execDAO.delete(num);
      }catch (Exception e) {
         e.printStackTrace();// TODO: handle exception
      }
      return result;
   }

   public String selectResult(int num){
      String result=null;
      try{
         result=execDAO.selectResult(num);

      }catch(Exception e){
         e.printStackTrace();
      }
      return result;
   }


}
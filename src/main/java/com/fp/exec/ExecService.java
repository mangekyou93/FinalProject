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

	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager =listData.makePage(execDAO.totalCount(rowNum));
		List<ExecDTO> ar=null; 
		try{
			ar=execDAO.selectList(rowNum);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.addObject("menuTitle", "과제 게시판");

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
	
	
	public int deleteAll(String str){
		return 0;
	}
}

package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.util.ListData;
import com.fp.notice.NoticeService;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@Inject
	NoticeService noticeService;

	//게시판 리스트 
		@RequestMapping(value="freeboard")
		public ModelAndView freeboard(ModelAndView mv, ListData listData) {
			System.out.println("IN");
			
			if(listData.getKind()==""){
				listData.setKind("title");
			}
			if(listData.getCurPage()==0){
				listData.setCurPage(1);
			}
			try {
				noticeService.selectList(listData, mv);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("board/boardList");
			return mv;
		}
}

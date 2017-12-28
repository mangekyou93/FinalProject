package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.qna.QnaService;

@Controller
@RequestMapping(value="/qna/*")
public class QnaController {

	@Inject
	QnaService qnaService;
}

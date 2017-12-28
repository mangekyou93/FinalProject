package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.notice.NoticeService;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@Inject
	NoticeService noticeService;
}

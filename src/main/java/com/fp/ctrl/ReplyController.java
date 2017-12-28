package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.reply.ReplyService;

@Controller
@RequestMapping(value="/reply/*")
public class ReplyController {

	@Inject
	ReplyService replyService;
}

package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.member.MemberService;
import com.fp.messenger.MessengerService;

@Controller
@RequestMapping(value="/messenger/*")
public class MessengerController {

	@Inject
	MessengerService messengerService;
}

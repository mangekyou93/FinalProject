package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.review.ReviewService;

@Controller
@RequestMapping(value="/review/*")
public class ReviewController {

	@Inject
	ReviewService reviewService;
	
}

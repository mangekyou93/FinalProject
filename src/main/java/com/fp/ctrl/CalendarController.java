package com.fp.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.calendar.CalendarService;

@Controller
@RequestMapping(value="/calendar/*")
public class CalendarController {

	@Inject
	CalendarService calendarService;
}

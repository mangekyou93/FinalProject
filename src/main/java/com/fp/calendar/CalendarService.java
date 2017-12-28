package com.fp.calendar;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CalendarService {

	@Inject
	CalendarDAO calendarDAO;
}

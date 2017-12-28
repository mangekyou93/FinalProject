package com.fp.messenger;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MessengerService {

	@Inject
	MessengerDAO messengerDAO;
	
}

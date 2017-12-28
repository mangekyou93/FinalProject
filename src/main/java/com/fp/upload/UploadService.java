package com.fp.upload;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UploadService {

	@Inject
	UploadDAO uploadDAO;
	
}

package com.menu.service;

import com.menu.bean.Attachment;



public interface IAttachmentService {

	public int save(Attachment attachment);
	
	public Attachment get(int id);
}

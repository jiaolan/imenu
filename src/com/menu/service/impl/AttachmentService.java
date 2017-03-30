package com.menu.service.impl;

import com.menu.bean.Attachment;
import com.menu.dao.IAttachmentDao;
import com.menu.dao.impl.AttachmentDao;
import com.menu.service.IAttachmentService;



public class AttachmentService implements IAttachmentService{
	
	IAttachmentDao attachmentDao = new AttachmentDao();
	
	@Override
	public int save(Attachment attachment) {
		
		return attachmentDao.save(attachment);
		
	}
	@Override
	public Attachment get(int id) {
		
		return attachmentDao.get(id);
	}

}

package com.menu.dao;

import com.menu.bean.Attachment;



public interface IAttachmentDao {
	
	public int save(Attachment attachment);
	
	public Attachment get(int id);

}

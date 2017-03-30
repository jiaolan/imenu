package com.menu.dao.impl;

import com.menu.bean.Attachment;
import com.menu.dao.IAttachmentDao;
import com.menu.util.JdbcUtil;


public class AttachmentDao implements IAttachmentDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	
	@Override
	public int save(Attachment attachment) {
		String sql = "insert into attachment (id,name,path) values(seq_attachment.nextval,?,?)";
		String idSql = "select id from attachment where rowId = ?";
		return jdbcUtil.insert(sql, idSql, new Object[]{attachment.getName(),attachment.getPath()});
	}

	@Override
	public Attachment get(int id) {
		String sql = "select * from attachment where id = ?";
		return jdbcUtil.executeQuery(Attachment.class, sql, new Object[]{id}).get(0);
	}

	
	
}

package com.menu.service.impl;

import java.util.List;

import com.menu.bean.Comment;
import com.menu.dao.ICommentDao;
import com.menu.dao.impl.CommentDao;
import com.menu.service.ICommentService;

public class CommentService implements ICommentService{

	ICommentDao commentDao = new CommentDao();
	@Override
	public void save(Comment comment) {
		commentDao.save(comment);        
	}

	@Override
	public void update(Comment comment) {
		commentDao.update(comment);
	}

	@Override
	public void delete(int commId) {
		commentDao.delete(commId);
	}

	@Override
	public List<Comment> list(Comment comment) {
		return commentDao.list(comment);
	}

	@Override
	public List<Comment> getmenuId(int menuId) {
		return commentDao.getMenuId(menuId);
	}

	@Override
	public List<Comment> getuserId(int userId) {
		return commentDao.getUserId(userId);
	}

	@Override
	public Comment getcommId(int commId) {
		return commentDao.getCommId(commId);
	}

}

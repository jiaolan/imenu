package com.menu.service;

import java.util.List;

import com.menu.bean.Comment;

public interface ICommentService {
	public void save(Comment comment);
	
	public void update(Comment comment);
	
	public void delete(int commId);
	
	public List<Comment> list(Comment comment);
	
	public List<Comment> getmenuId(int menuId);
	
	public List<Comment> getuserId(int userId);
	
	public Comment getcommId(int commId);
}

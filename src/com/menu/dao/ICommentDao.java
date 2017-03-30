package com.menu.dao;

import java.util.List;

import com.menu.bean.Comment;

public interface ICommentDao {
	public void save(Comment comment);
	
	public void delete(int commId);
	
	public List<Comment> list(Comment comment);
	
	public void update(Comment comment);
	
	public List<Comment> getMenuId(int menuId);
	
	public List<Comment> getUserId(int userId);
	
	public Comment getCommId(int commId);
}

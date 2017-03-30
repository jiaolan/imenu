package com.menu.dao.impl;

import java.util.List;

import com.menu.bean.Comment;
import com.menu.dao.ICommentDao;
import com.menu.util.JdbcUtil;

public class CommentDao implements ICommentDao{

	JdbcUtil jdbcUtil = new JdbcUtil();
	@Override
	public void save(Comment comment) {
		String sql = "insert into m_comment (COMM_ID,USER_ID,USER_NAME,MENU_ID,COMM_DETAIL) values (seq_comment.nextval,?,?,?,?)";
		jdbcUtil.execute(sql, new Object[]{comment.getUserId(),comment.getUserName(),comment.getMenuId(),comment.getCommDetail()});
	}

	@Override
	public void delete(int commId) {
		String sql = "delete from m_comment where comm_id=?";
		jdbcUtil.execute(sql, new Object[]{commId});
	}

	@Override
	public List<Comment> list(Comment comment) {
		String sql = "select * from m_comment where 1=1";
		return jdbcUtil.executeQuery(Comment.class, sql, null);
	}

	@Override
	public void update(Comment comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Comment> getMenuId(int menuId) {
		String sql = "select * from m_comment where menu_id=? ";
		return jdbcUtil.executeQuery(Comment.class, sql, new Object[]{menuId});
	}

	@Override
	public List<Comment> getUserId(int userId) {
		String sql = "select * from m_comment where user_id=? ";
		return jdbcUtil.executeQuery(Comment.class, sql, new Object[]{userId});
	}

	@Override
	public Comment getCommId(int commId) {
		String sql = "select * from m_comment where comm_id=? ";
		return jdbcUtil.executeQuery(Comment.class, sql, new Object[]{commId}).get(0);
	}

}

package com.gopal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gopal.db.DBConnection;
import com.gopal.entity.ContentEntity;
import com.gopal.entity.UserEntity;

public class PostDao {
	private static final String SAVE_CONTENT_QUERY = "INSERT INTO post(title,content,uid) VALUES(?,?,?)";
	private static final String UPDATE_CONTENT_QUERY = "UPDATE post SET title=?,content=? WHERE id=?";
	private static final String GET_CONTENT_DETIAL = "SELECT * FROM post WHERE uid=?";
	private static final String GET_CONTENT_INFO = "SELECT * FROM post WHERE id=?";
	private static final String DELETE_CONTENT = "DELETE FROM post WHERE id=?";
	
	private static  int isDone = 0;
	private static PreparedStatement pst = null;
	private static Connection con = DBConnection.getConnection();
	
	
	public static int insertContent(String title,String content,int id) throws SQLException {
		isDone = 0;
		try {
			pst = con.prepareStatement(SAVE_CONTENT_QUERY);
			pst.setString(1,title);
			pst.setString(2,content);
			pst.setInt(3,id);
			isDone = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDone;
	}
	
	public static List<ContentEntity> getContentDetail(int id){
		List<ContentEntity> li = new ArrayList<ContentEntity>();
		ContentEntity content = null;
		try {
			PreparedStatement pst = con.prepareStatement(GET_CONTENT_DETIAL);
			pst.setInt(1, id);
			
			ResultSet rst = pst.executeQuery();
//			post table columns 
//			id | title | content | date | uid 
			while(rst.next()) {
				content = new ContentEntity();
				content.setId(rst.getInt("id"));
				content.setTitle(rst.getString("title"));
				content.setContent(rst.getString("content"));
				content.setDate(rst.getTimestamp("date"));
				content.setUid(rst.getInt("uid"));
				
				li.add(content);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return li;
	}
	
	
	public static int deletePost(int id) {
		int i = 0;
		try {
			PreparedStatement pst = con.prepareStatement(DELETE_CONTENT);
			pst.setInt(1, id);
			
			i = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
		
	}
	
	public static ContentEntity getContentInfo(int id){
		ContentEntity content = null;
		try {
			PreparedStatement pst = con.prepareStatement(GET_CONTENT_INFO);
			pst.setInt(1, id);
			
			ResultSet rst = pst.executeQuery();
//			post table columns 
//			id | title | content | date | uid 
			while(rst.next()) {
				content = new ContentEntity();
				content.setId(rst.getInt("id"));
				content.setTitle(rst.getString("title"));
				content.setContent(rst.getString("content"));
				content.setDate(rst.getTimestamp("date"));
				content.setUid(rst.getInt("uid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return content;
	}
	
	public static int updateContent(String title,String content,int id) throws SQLException {
		isDone = 0;
		try {
			pst = con.prepareStatement(UPDATE_CONTENT_QUERY);
			pst.setString(1,title);
			pst.setString(2,content);
			pst.setInt(3,id);
			isDone = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDone;
	}
}

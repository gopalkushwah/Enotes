package com.gopal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.gopal.db.DBConnection;
import com.gopal.entity.UserEntity;

public class UserDao {
	private static final String SAVE_QUERY = "INSERT INTO user(fullname,email,password) VALUES(?,?,?)";
	private static final String GET_USER_EMAIL_QUERY = "SELECT * FROM user WHERE email=?";
	private static final String LOGIN_USER = "SELECT * FROM user WHERE email=? AND password=?";
	
	private static  int isDone = 0;
	private static boolean isTrue = false;
	
	private static PreparedStatement pst = null;
	private static Connection con = DBConnection.getConnection();
	
	public static int saveUser(UserEntity user) throws SQLException {
		try {
			pst = con.prepareStatement(SAVE_QUERY);
			pst.setString(1,user.getFullname());
			pst.setString(2,user.getEmail());
			pst.setString(3,user.getPassword());
			isDone = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDone;
	}
	
	public static boolean getUserEmail(String email) throws SQLException {
		isTrue = false;
		try {
			pst = con.prepareStatement(GET_USER_EMAIL_QUERY);
			pst.setString(1, email);
			ResultSet rst = pst.executeQuery();
			while(rst.next()) {
				if(rst.getString(3).equals(email)) {
					isTrue = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isTrue;
	}
	public static UserEntity getUserInfo(String email) throws SQLException {
		UserEntity user = new UserEntity();
		try {
			pst = con.prepareStatement(GET_USER_EMAIL_QUERY);
			pst.setString(1, email);
			ResultSet rst = pst.executeQuery();
			while(rst.next()) {
				user.setId(rst.getInt(1));
				user.setFullname(rst.getString(2));
				user.setEmail(rst.getString(3));
				user.setPassword(rst.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public static boolean loginUser(UserEntity user) {
		isTrue = false;
		try {
			pst = con.prepareStatement(LOGIN_USER);
			pst.setString(1, user.getEmail());
			pst.setString(2, user.getPassword());
			ResultSet rst = pst.executeQuery();
			if(rst.next()) {
				isTrue = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isTrue;
	}
	
	
}

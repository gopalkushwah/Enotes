package com.gopal.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection con = null;
	private static final String URL = "jdbc:mysql://localhost/enotes";
	private static final String USER = "root";
	private static final String PASS = "1234";
	
	public static Connection getConnection() {
		try {
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(URL,USER,PASS);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
}

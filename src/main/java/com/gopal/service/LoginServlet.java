package com.gopal.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.dao.UserDao;
import com.gopal.entity.UserEntity;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			UserEntity user = new UserEntity();
			user.setEmail(email);
			user.setPassword(password);
			boolean isTrue = UserDao.loginUser(user);
			UserEntity userDetail = UserDao.getUserInfo(email);
			if(isTrue) {
				HttpSession session = request.getSession();
				session.setAttribute("login-success", userDetail.getFullname());
				session.setAttribute("user-info", userDetail);
				response.sendRedirect("addNotes.jsp");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("login-faild", "Invalid Credentials! Try Again");
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}

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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		boolean check = false;
		HttpSession session = null;
		boolean isTrue = false;
		String name = request.getParameter("fname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			isTrue = UserDao.getUserEmail(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(isTrue!=true) {
			if(request.getParameter("check")!=null) {
				check = true;
			}else {
				check = false;
			}
			if(check==true) {
				UserEntity user = new UserEntity();
				user.setFullname(name);
				user.setEmail(email);
				user.setPassword(password);
				
				int isDone;
				try {
					isDone = UserDao.saveUser(user);
					if(isDone>0) {
						session = request.getSession();
						session.setAttribute("reg-done","Registration Done <a href=\"login.jsp\" class=\"regDone\">To Login Click Here</a>");
						response.sendRedirect("register.jsp");
					}else {
						session = request.getSession();
						session.setAttribute("cant-reg","Something went wrong! try again");
						response.sendRedirect("register.jsp");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}else {
				session = request.getSession();
				session.setAttribute("check", "Some fields are remain empty !");
				response.sendRedirect("register.jsp");
				
			}
		}else {
			session = request.getSession();
			session.setAttribute("already", "Already have an account from this mail!");
			response.sendRedirect("register.jsp");
			
		}
	}
}

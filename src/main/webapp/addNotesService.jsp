<%@page import="com.gopal.dao.PostDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.gopal.entity.UserEntity"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	UserEntity user = (UserEntity)session.getAttribute("user-info");
	try {
		int status = PostDao.insertContent(title, content, user.getId());
		if(status>0) {
			session.setAttribute("note-saved", "Notes successfuly added to store...");
			response.sendRedirect("addNotes.jsp");
		}else {
			session.setAttribute("not-saved", "Please try again...");
			response.sendRedirect("addNotes.jsp");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.gopal.dao.PostDao"%>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
int id = (Integer)session.getAttribute("update_id");
try {
	int status = PostDao.updateContent(title, content, id);
	if(status>0) {
		session.setAttribute("note-update", "Notes successfuly Updated...");
		response.sendRedirect("viewNotes.jsp");
	}else {
		session.setAttribute("not-update", "Please try again...");
		response.sendRedirect("editPost.jsp");
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
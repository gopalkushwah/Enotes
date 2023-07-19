<%
	session.removeAttribute("login-success");
	session.removeAttribute("user-info");
	session.setAttribute("logout", "Logout Successfull! login to add or view Notes");
	response.sendRedirect("login.jsp");
%>
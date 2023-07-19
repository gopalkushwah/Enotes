<%@page import="com.gopal.dao.PostDao"%>
<%@page import="com.gopal.entity.ContentEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String isLogin1 = (String) session.getAttribute("login-success");
if (isLogin1 == null) {
	session.setAttribute("without-login", "Please Login to View Notes...");
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Read More</title>
		<%@include file="./all_components/allcss.jsp"%>
	</head>
	<body>
		<%@include file="./all_components/navbar.jsp"%>
		<%
			int id = Integer.parseInt(request.getQueryString().substring(3));
			ContentEntity content = PostDao.getContentInfo(id);
		%>
		<div class="container">
			<div class="card mt-5 mb-5 border-dark">
			  <div class="card-header border-dark">
			  <p>Title:</p>
			    <h4><%=content.getTitle() %></h4>
			  </div>
			  <div class="card-body">
			    <p class="card-text"><%=content.getContent() %></p>
			    <hr>
			    <p class="card-title">Date Added : <b><%=content.getDate().toLocaleString() %></b></p>
			  </div>
			</div>
		</div>
<%@include file="./all_components/footer.jsp"%>
		<%@include file="./all_components/alljs.jsp"%>
	</body>
</html>
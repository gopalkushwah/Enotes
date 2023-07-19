<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String isLogin1 = (String)session.getAttribute("login-success");
	if(isLogin1==null){
		session.setAttribute("without-login", "Please Login to View Notes...");
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<%@include file="./all_components/allcss.jsp"%>
	</head>
	<body>
		<%@include file="./all_components/navbar.jsp"%>
		
			<div class="home-container" >
				<img class="img" alt="" src="./assets/paper.png">
				<h1>START WRITING NOTES AND SAVE FOR FUTURE</h1>
				<a href="addNotes.jsp">Add Note</a>
			</div>
			
		<%@include file="./all_components/footer.jsp"%>
		<%@include file="./all_components/alljs.jsp"%>
	</body>
</html>
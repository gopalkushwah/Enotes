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
		<title>Edit </title>
		<%@include file="./all_components/allcss.jsp"%>
	</head>
	<body>
		<%@include file="./all_components/navbar.jsp"%>
		<%
			if(request.getQueryString()!=null){
				int id = Integer.parseInt(request.getQueryString().substring(3));
				session.setAttribute("update_id", id);
			}
		%>
		<div class="add-container">
			<div class="add-in-cont">
			<form action="editPostService.jsp" method="post"  class="add-form">
				<h1 class="text-center">Edit Notes</h1>
				<%
					String noteUpdated = (String)session.getAttribute("note-update");
					if(noteUpdated!=null){
						%>
						<div><%= noteUpdated %></div>
						<%
						session.removeAttribute("note-update");
						}
				%>
				<%
					String notUpdate = (String)session.getAttribute("not-update");
					if(notUpdate!=null){
						%>
						<div><%= notUpdate %></div>
						<%
						session.removeAttribute("not-update");
						}
				%>
				<div>
					<label for="input-1">Enter Title</label>
					<input id="input-1" placeholder="Enter Title" type="text" name="title" required/>
				</div>
				<div>
					<label>Type your Notes Here...</label>
					<textarea rows="9" placeholder="Enter Text" type="text" name="content" required></textarea>
				</div>
				<div>
					<input id="input-3" type="submit" value="Add"/>
					
				</div>
			</form>		
			</div>
		</div>
<%@include file="./all_components/footer.jsp"%>
		<%@include file="./all_components/alljs.jsp"%>
	</body>
</html>
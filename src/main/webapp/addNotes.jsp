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
		<title>Add Notes</title>
		<%@include file="./all_components/allcss.jsp"%>
	</head>
	<body>
		<%@include file="./all_components/navbar.jsp"%>
		
		<div class="add-container">
			<div class="add-in-cont">
			<form action="addNotesService.jsp" method="post"  class="add-form">
				<h1 class="text-center">Add Notes</h1>
				<%
					String noteSaved = (String)session.getAttribute("note-saved");
					if(noteSaved!=null){
						%>
						<div><%= noteSaved %></div>
						<%
						session.removeAttribute("note-saved");
						}
				%>
				<%
					String notSaved = (String)session.getAttribute("not-saved");
					if(notSaved!=null){
						%>
						<div><%= notSaved %></div>
						<%
						session.removeAttribute("not-saved");
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
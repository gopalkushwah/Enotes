<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<%@include file="./all_components/allcss.jsp" %>

	</head>

	<body>
		<%@include file="./all_components/navbar.jsp" %>
			<section class="justify-text container mt-3" style="text-align: justify;">
				<h1>Welcome to E Notes.com</h1>
				<p class="lead">Welcome to our note-taking website! We provide a convenient and intuitive
					platform
					for
					organizing your thoughts, ideas, and important information. Whether you're a student,
					professional,
					or simply someone who loves jotting down notes, our website is designed to streamline your
					note-taking process and keep everything in one place.</p>
				<p class="lead">With our user-friendly interface, you can easily create, edit, and organize your
					notes
					with just a few clicks. Our intuitive organization system allows you to categorize your
					notes
					into
					different folders or tags, making it effortless to find and retrieve them later. You can
					also
					add
					labels, colors, or priority levels to further customize and prioritize your notes.</p>
				<p class="lead">Collaboration is made simple with our shared note feature. You can invite others
					to
					view
					or collaborate on specific notes, making it ideal for group projects, team meetings, or
					study
					groups. Stay connected and work together seamlessly.</p>
				<div class="link-container text-center p-4">
					<%
					String loginDone = (String)session.getAttribute("login-success");
					if(loginDone!=null){
						%>
						<a href="home.jsp" class="btn-custom redirect">Home</a>
						<%}else{%>
							<a href="login.jsp" class="btn-custom redirect">Login</a>
							<a href="register.jsp" class="btn-custom redirect">Register</a>
					<% }
					%>
				</div>
			</section>
			<%@include file="./all_components/footer.jsp" %>
			<%@include file="./all_components/alljs.jsp" %>
	</body>

	</html>
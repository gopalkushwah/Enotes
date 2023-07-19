<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - get in touch</title>
<%@include file="./all_components/allcss.jsp" %>
</head>
<body>
	<%@include file="./all_components/navbar.jsp" %>
	<div class="container-fluid ">
		<div class="row  p-5 ">
			<div class="col-md-4 offset-md-4 shadow p-4 rounded">
				<form action="LoginServlet" method="post">
					<h3 class="text-center">Login</h3>
					<%
						String isFailed = (String)session.getAttribute("login-faild");
						if(isFailed!=null){
							%>
							<div class="alert alert-danger" role="alert">
							  <%= isFailed %>
							</div>
							<%
						session.removeAttribute("login-faild");
						}
					%>
					<%
						String withoutLogin = (String)session.getAttribute("without-login");
						if(withoutLogin!=null){
							%>
							<div class="alert alert-danger" role="alert">
							  <%= withoutLogin %>
							</div>
							<%
						session.removeAttribute("without-login");
						}
					%>
					<%
						String logout = (String)session.getAttribute("logout");
						if(logout!=null){
							%>
							<div class="alert alert-success" role="alert">
							  <%= logout %>
							</div>
							<%
						session.removeAttribute("logout");
						}
					%>
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
				    </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
				  </div>
				  <button type="submit" class="btn btn-danger ">Login</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="./all_components/footer.jsp" %>
	<%@include file="./all_components/alljs.jsp" %>		
</body>
</html>
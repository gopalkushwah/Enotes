<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - get in touch</title>
<%@include file="./all_components/allcss.jsp" %>
</head>
<body>
	<%@include file="./all_components/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-5 ">
			<div class="col-sm-12 col-md-4 offset-md-4  shadow p-4 rounded">
			
			
			
				<form action="UserServlet" method="post">
					<h3 class="text-center">Register</h3>
				  <div id="emailHelp" class="form-text mb-1">We'll never share your information with anyone else.</div>
					<%
				  	String regDone = (String)session.getAttribute("reg-done");
			  		if(regDone!=null){
				  	%>
						<div class="alert alert-info" role="alert"><%= regDone %></div>
					<%
			  		session.removeAttribute("reg-done");
					}
					%>
				  
				  <%
				  	String failedReg = (String)session.getAttribute("cant-reg");
				  	if(failedReg!=null){
				  	%>
						<div class="alert alert-danger" role="alert"><%= failedReg %></div>
					<%
			  		session.removeAttribute("cant-reg");
					}
				  %>
				  <%
				  	String check = (String)session.getAttribute("check");
				  	if(check!=null){
				  	%>
						<div class="alert alert-danger" role="alert"><%= check %></div>
					<%
			  		session.removeAttribute("check");
					}
				  %>
				  <%
				  	String already = (String)session.getAttribute("already");
				  	if(already!=null){
				  	%>
						<div class="alert alert-danger" role="alert"><%= already %></div>
					<%
			  		session.removeAttribute("already");
					}
				  %>
				  
				  
				  <div class="mb-3">
				    <label for="exampleInputName" class="form-label">Enter Full Name</label>
				    <input type="text" class="form-control" id="exampleInputName" name="fname">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
				    </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
				  </div>
				  <div class="mb-3 form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1" value="1" name="check">
				    <label class="form-check-label" for="exampleCheck1">I agree to The terms and conditions</label>
				  </div>
				  <button type="submit" class="btn btn-danger">Register</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="./all_components/footer.jsp" %>
	<%@include file="./all_components/alljs.jsp" %>		
</body>
</html>
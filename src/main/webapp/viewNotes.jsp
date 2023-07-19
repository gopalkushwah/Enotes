<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@page import="com.gopal.dao.PostDao"%>
<%@page import="com.gopal.entity.ContentEntity"%>
<%@page import="java.util.List"%>
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
<title>View Notes</title>
<%@include file="./all_components/allcss.jsp"%>
</head>
<body>
	<%@include file="./all_components/navbar.jsp"%>
	<%
	UserEntity userDetail = (UserEntity) session.getAttribute("user-info");
	if (userDetail != null) {
		List<ContentEntity> li = PostDao.getContentDetail(userDetail.getId());
		int i = 1;
	%>
	<div class="container mt-3  mb-5">
		<div class="row mb-3">
			<%
			for (ContentEntity ce : li) {
			%>
			<div class="col-sm-4 mt-3 align-items-stretch  equal-height">
				<div class="card border-danger">
					<div class="card-body">
						<h5 class="card-title">
							<%
							session.setAttribute("post-id", ce.getId());
							if (ce.getTitle().length() <= 36) {
							%>
							<%=ce.getTitle()%>
							<%
							} else {
							%>
							<%=ce.getTitle().subSequence(0, 35)%>...
							<%
							}
							%>
						</h5>
						<hr>

						<%
						if (ce.getContent().length() <= 70) {
						%>
						<p class="card-text"><%=ce.getContent()%><br> <a
								href="readMore.jsp?id=<%=ce.getId()%>">Read More</a>
						</p>
						<%
						} else {
						%>
						<p class="card-text"><%=ce.getContent().subSequence(0, 69)%>...
							<br> <a href="readMore.jsp?id=<%=ce.getId()%>">Read More</a>
						</p>
						<%
						}
						String date = ce.getDate().toLocaleString();
						%>
						<p>
							Date added :
							<%=date%></p>
						<a href="editPost.jsp?id=<%=ce.getId()%>" class="btn btn-success"
							data-toggle="modal" data-target="#exampleModalCenter<%=i%>">Edit</a>
						<a href="deletePost.jsp?id=<%=ce.getId()%>" class="btn btn-danger">Delete</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%
	}
	%>
	<%@include file="./all_components/footer.jsp"%>
	<%@include file="./all_components/alljs.jsp"%>
</body>
</html>
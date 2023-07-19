<%@page import="com.gopal.dao.PostDao"%>
<%
	 int id = Integer.parseInt(request.getQueryString().substring(3));
	 int st = PostDao.deletePost(id);
	 if(st>0){
		 session.setAttribute("post-deleted", "Post Deleted Successfully..");
		 response.sendRedirect("viewNotes.jsp");
	 }else{
		 session.setAttribute("delete-fail", "Can't Delete Post..");
		 response.sendRedirect("viewNotes.jsp");
	 }
%>
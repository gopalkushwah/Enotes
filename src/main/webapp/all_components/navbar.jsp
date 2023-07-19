<%@page import="com.gopal.entity.UserEntity"%>
<nav class="navbar navbar-expand-lg navbar-light bg-white navbar-custom sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="/ENotes/"><span>E</span>Notes<span>.</span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item nav-custom-item">
          <a class="nav-link active" aria-current="page" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li class="nav-item nav-custom-item">
          <a class="nav-link" href="addNotes.jsp"><i class="fa-solid fa-plus"></i> Add Note</a>
        </li>
        <li class="nav-item nav-custom-item">
          <a class="nav-link" href="viewNotes.jsp"><i class="fa-solid fa-eye"></i> View Notes</a>
        </li>
        <!--  -->
        <%
        if(request.getRequestURI().equals("/ENotes/readMore.jsp")){
        %>
	       <li class="nav-item nav-custom-item nav-border">
	          <a class="nav-link" href="#"><i class="fa-solid fa-book-open-reader"></i> Read More</a>
	       </li>
        <%
        }
        %>
        <%
        if(request.getRequestURI().equals("/ENotes/editPost.jsp")){
        %>
	       <li class="nav-item nav-custom-item nav-border">
	          <a class="nav-link" href="#"><i class="fa-solid fa-pen"></i> Edit Post</a>
	       </li>
        <%
        }
        %>
        
        <!--  -->
        <li class="nav-item dropdown">
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
      <div class="d-flex">
        <%
        String isLogin = (String)session.getAttribute("login-success");
        if(isLogin!=null){
        	%>
        	<li class="nav-item mx-2">
	          <a class="nav-link btn-custom" href="profile.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal"><%= isLogin %></a>
	        </li>
	        <li class="nav-item mx-2">
	          <a class="nav-link btn-custom" href="isLogout.jsp">LogOut</a>
	        </li>
        	<%
        }else{
        	%>
       	  <li class="nav-item mx-2">
	        <a class="nav-link btn-custom" href="login.jsp">Login</a>
	      </li>
	      <li class="nav-item mx-2">
	        <a class="nav-link btn-custom" href="register.jsp">Register</a>
	      </li>
        	<%
        }
        %>
      </div>
    </div>
  </div>
</nav>
<%
	UserEntity user = (UserEntity)session.getAttribute("user-info");
%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fa-solid fa-user" style="margin-right: .5rem"></i><%= isLogin %></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <%
        if(user!=null){
        	%>
        	<div>Id : <%=user.getId() %></div>
        <div>Name : <%=user.getFullname() %></div>
        <div>Email : <%=user.getEmail() %></div>
        	<%
        }
        %>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
 -->      </div>
    </div>
  </div>
</div>
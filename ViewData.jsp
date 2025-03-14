<%@ page import="com.Student.DTO.Student" %>
<%@ page import="com.Student.DAO.StudentDAO" %>
<%@ page import="com.Student.DAO.StudentDAOImp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.lang.Long" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
 		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initialscale=1.0">
		 <title>Student Management</title>
 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<style>
			fieldset {
				padding: 20px;
            	border: 2px solid black;
            	margin-left: 50px;
            	margin-right:50px;
            	border-radius: 10px;
            	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
        	}

        	legend {
           	 	font-weight: bold;
            	color: #eec881;
       	 	}
       	 	.nav-item {
       	 		margin-right: 20px;
       	 	}
       	 	.highlight {
       	 		backgroung-color: #ffeb3b;
       	 		font-weight: bold;
       	 	}
		</style>
	</head>
	<body>
		<% Student s = (Student)session.getAttribute("student");
		StudentDAO sdao = new StudentDAOImp();
		ArrayList<Student> students = (ArrayList<Student>)sdao.getStudent();
		Iterator<Student> it = students.iterator();%>
		
 		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 			<div class="container-fluid">
 				<a class="navbar-brand" href="#">Welcome Admin: <%=s.getName() %> </a>
 		  		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
 					<span class="navbar-toggler-icon"></span>
 				</button>
 				<div class="collapse navbar-collapse" id="navbarNav">
 					<ul class="navbar-nav ms-auto">
 						<li class="nav-item">
 							<a class="nav-link" href="ForgotPin.jsp"></a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="Dashboard.jsp">Move to Dashboard</a>
 						</li>
 						
 					<!--  	<li class="nav-item">
 							<form action="logout" method="post">
	 							<input class="btn btn-danger" type="submit" name="logout" value="Logout">
 							</form>
						</li>
					-->
 					</ul>
 				</div>
 			</div>
 		</nav>
 		<div class="container mt-4">
 			<h1 class="text-center mb-4"></h1>
		</div>
		<fieldset>
		<% String success = (String)request.getAttribute("success");
		if(success!=null) {%>
			<h3 class="success" style="color:green;"> <%= success %></h3>
		<%} %>
		
		<% String failure = (String)request.getAttribute("failure");
		if(failure!=null) {%>
			<h3 class="failure" style="color:red;"> <%= failure %></h3>
		<%} %>
		<!-- User Section -->
 		<div class="row">
 			<div class="col-md-12">
 			
 				<legend>All Student Data</legend>
 			<form method="get" action="ViewData.jsp" class="d-flex justify-content-center mb-4">
        <%
            String searchId = request.getParameter("id");
            String inputValue = (searchId != null && !searchId.trim().isEmpty()) ? searchId : "";
        %>
        <input type="text" name="id" class="form-control w-50 me-2" placeholder="Enter Student ID" value="<%= inputValue %>">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
 					
 					
 					
 				<br>
 				<table class="table table-hover">
 					<thead>
 						<tr>
							<th>Id</th>
							<th>Name</th>
	 						<th>Phone</th>
 							<th>Mail ID</th>
 							<th>Branch</th>
 							<th>Location</th>
 							<th>Remove</th>
 						</tr>
 					</thead>
 					<tbody>
 						
 						<%while(it.hasNext()) {
 							Student s1 = it.next();
 						//	Student sid = (Student)request.getAttribute("searchid");
 							
 						if(s1.getId()==1) {%>
 						<tr>
 							<td><b><%=s1.getId()%></b></td>
 							<td><b><%=s1.getName()%></b></td>
 							<td><b><%=s1.getPhone() %></b></td>
 							<td><b><%=s1.getMail() %></b></td>
 							<td><b><%=s1.getBranch() %></b></td>
 							<td><b><%=s1.getLocation() %></b></td>
 							<td>
 								<form action="deleteUser" method="post">
 	                            	<input  type="hidden" name="id" value="<%=s1.getId()%>">
 	                            	<input class="btn btn-danger" type="submit" value="Delete">							
 								</form>
 							</td>
 						</tr>
 						<%}
 						else { 
 						String highlightId = request.getParameter("id");
 						boolean isHighlighted = highlightId !=null;
 						String rowClass = isHighlighted ? "highlight" : "";%>
 				
 						<tr>
 							<td><%=s1.getId()%></td>
 							<td><%=s1.getName()%></td>
 							<td><%=s1.getPhone() %></td>
 							<td><%=s1.getMail() %></td>
 							<td><%=s1.getBranch() %></td>
 							<td><%=s1.getLocation() %></td>
 							<td>
 								<form action="deleteUser" method="post">
 	                            	<input  type="hidden" name="id" value="<%=s1.getId()%>">
 	                            	<input class="btn btn-danger" type="submit" value="Delete">							
 								</form>
 							</td>
 						</tr>
 						<%}
 						}%>
					</tbody>
 				</table>
 				</fieldset>
 			</div>
 		</div>
	</body>
</html>
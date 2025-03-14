<%@ page import="com.Student.DTO.Student" %>

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
		</style>
	</head>
	<body>
		<% Student s = (Student)session.getAttribute("student");%>
 		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 			<div class="container-fluid">
 				<%if(s.getId() == 1) {%>
 					<a class="navbar-brand" href="#">Welcome Admin: <%=s.getName() %> </a>
 		  		<%} 
 		  		else {%>
 		  			<a class="navbar-brand" href="#">Welcome: <%=s.getName() %> </a>
 		  		<%} %>
 		  		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
 					<span class="navbar-toggler-icon"></span>
 				</button>
 				<div class="collapse navbar-collapse" id="navbarNav">
 					<ul class="navbar-nav ms-auto">
 						<%if(s.getId() == 1) {%>
 							<li class="nav-item">
 								<a class="nav-link" href="ViewData.jsp">View Data</a>
 							</li>
 						<%} %>
 						
 						<li class="nav-item">
 							<a class="nav-link" href="ForgotPin.jsp">Reset Password</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="UpdateAccount.jsp">Update Data</a>
 						</li>
 						
 						<li class="nav-item">
 							<form action="logout" method="post">
	 							<input class="btn btn-danger" type="submit" name="logout" value="Logout">
 							</form>
						</li>
 					</ul>
 				</div>
 			</div>
 		</nav>
 		
 		<div class="container mt-4">
 			<h1 class="text-center mb-4"><u>Dashboard</u></h1>
		</div>
		<!-- User Section -->
		<fieldset>
		<legend>View Your Data</legend>
		<br>
 		<div class="row">
 			<div class="col-md-12">
 			
 				
 				<table class="table table-hover">
 					<thead>
 						<tr>
							<th>Id</th>
							<th>Name</th>
	 						<th>Phone</th>
 							<th>Mail ID</th>
 							<th>Branch</th>
 							<th>Location</th>
 						</tr>
 					</thead>
 					<tbody>
 						<tr> 
 							<td><%=s.getId() %></td>
 							<td><%=s.getName() %></td>
 							<td><%=s.getPhone() %></td>
 							<td><%=s.getMail() %></td>
 							<td><%=s.getBranch() %></td>
 							<td><%=s.getLocation() %></td>
					</tbody>
 				</table>
 				
 			</div>
 		</div>
 		</fieldset>
	</body>
</html>
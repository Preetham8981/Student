<%@ page import="com.Student.DTO.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<style>
			.heading {
				color: #000080;
			}

			.sub {
				color: #1e90ff;
			}
		</style>
	</head>
	<body bgcolor=''>
		<% Student s = (Student)session.getAttribute("student");%>
		<div align="center">
			<h1 class="heading">Pentagon Space</h1>
			<h3 class="sub">Update your Account</h3>
			<% String success = (String)request.getAttribute("success");
			if(success!=null) {%>
				<h3 class="success" style="color:green;"> <%= success %></h3>
			<%} %>
		
			<% String failure = (String)request.getAttribute("failure");
			if(failure!=null) {%>
				<h3 class="failure" style="color:red;"> <%= failure %></h3>
			<%} %>
			<form action="updateAccount" method="post">
				<table>
					<tr>
						<td><b>Enter your Name:</b></td>
						<td><input type="text" name="name" placeholder="Name" value="<%=s.getName()%>"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Phone number:</b></td>
						<td><input type="tel" name="phone" placeholder="Phone Number" value="<%=s.getPhone()%>"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Mail ID:</b></td>
						<td><input type="email" name="mail" placeholder="Email" value="<%=s.getMail()%>"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Branch:</b></td>
						<td><input type="text" name="branch" placeholder="Branch" value="<%=s.getBranch()%>"></td>	
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Location:</b></td>
						<td><input type="text" name="loc" placeholder="Location" value="<%=s.getLocation()%>"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><input type="submit" value="update account"></td>
						<td><a href="Dashboard.jsp">Back</a></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
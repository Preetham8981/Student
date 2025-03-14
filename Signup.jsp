<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<style>
			fieldset {
            	border: 2px solid black;
            	margin-left: 550px;
            	margin-right:550px;
            	border-radius: 10px;
            	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
        	}

        	legend {
           	 	font-weight: bold;
            	color: #3a1d0b;
       	 	}
			.heading {
				color: #000080;
			}

			.sub {
				color: #1e90ff;
			}
		</style>
	</head>
	<body bgcolor='#add8e6'>
		<div align="center">
			<h1 class="heading"><u>Pentagon Space</u></h1>
			<h3 class="sub"><u>Application form</u></h3>
			<% String success = (String)request.getAttribute("success");
			if(success!=null) {%>
				<h3 class="success" style="color:green;"> <%= success %></h3>
			<%} %>
		
			<% String failure = (String)request.getAttribute("failure");
			if(failure!=null) {%>
				<h3 class="failure" style="color:red;"> <%= failure %></h3>
			<%} %>
			<fieldset>
				<legend><h2>Signup</h2></legend>
			<form action="Signup" method="post">
				<table>
					<tr>
						<td><b>Enter your Name:</b></td>
						<td><input type="text" name="name" placeholder="Name"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Phone number:</b></td>
						<td><input type="tel" name="phone" placeholder="Phone Number"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Mail ID:</b></td>
						<td><input type="email" name="mail" placeholder="Email"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Branch:</b></td>
						<td><input type="text" name="branch" placeholder="Branch"></td>	
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the Location:</b></td>
						<td><input type="text" name="loc" placeholder="Location"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the password:</b></td>
						<td><input type="password" name="password" placeholder="Password"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Confirm the password:</b></td>
						<td><input type="password" name="confirm" placeholder="Confirm Password"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><input type="submit" value="create account"></td>
						<td><b>already have a account? </b><a href="Login.jsp">login</a></td>
					</tr>
				</table>
			</form>
			</fieldset>
		</div>
	</body>
</html>
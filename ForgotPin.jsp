<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			fieldset {
            	border: 2px solid black;
            	margin-left: 560px;
            	margin-right:560px;
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
			<form action="forgotPin" method="post">
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
				<legend><h2>Create new password</h2></legend>
 				<table>
 					<tr>
 						<td><b>Enter the Phone number:</b></td>
 						<td><input type="tel" name="phone"></td>
 					</tr>
 					<tr>
 						<td><br></td>
 						<td><br></td>
 					</tr>
 					<tr>
 						<td><b>Enter the Mail ID:</b></td>
 						<td><input type="email" name="mail"></td>
 					</tr>
 					<tr>
					 	<td><br></td>
 						<td><br></td>
 					</tr>
					<tr>
						<td><b>Enter a new password:</b></td>
						<td><input type="password" name="password"></td>
					</tr>
 					<tr>
 						<td><br></td>
 						<td><br></td>
 					</tr>
 					<tr>
 						<td><b>Confirm the password:</b></td>
 						<td><input type="password" name="confirm"></td>
 					</tr>
 					<tr>
 						<td><br></td>
 						<td><br></td>
 					</tr>
 					<tr>
 						<td><input type="submit" value="Update Pin"></td>
 						<td><a href="Login.jsp">Back</a></td>
 					</tr>
 				</table>
 				</fieldset>
 			</form>
		</div>		
	</body>
</html>
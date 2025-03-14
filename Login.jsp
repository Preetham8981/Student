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
			<form action="login1" method="post">
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
				<legend><h2>Login</h2></legend>
				<table >
					<tr>
						<td><b>Enter your mail ID:</b></td>
						<td> <input type="email" name="mail" placeholder="Email" required="required"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td><b>Enter the password:</b></td>
						<td> <input type="password" name="password" placeholder="Password" required="required"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
 						<td><input type="submit" value="Login"></td>
						<td><a href="ForgotPin.jsp">forgot pin?</a></td>
 					</tr>
 					<tr>
 						<td><br></td>
 						<td><br></td>
 					</tr>
				</table>
				Don't have a account? <a href="Signup.jsp">Signup</a>
				</fieldset>
			</form>
		</div>
	</body>
</html>
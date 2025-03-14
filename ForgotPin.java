package com.Student.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.Student.DTO.Student;
import com.Student.DAO.StudentDAO;
import com.Student.DAO.StudentDAOImp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPin")
public class ForgotPin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//collect the data from user
		String phonenumber=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String password=req.getParameter("password");
		String confirmPassword=req.getParameter("confirm");
		 
		//conversion of datatypes
		long phone=Long.parseLong(phonenumber);
		PrintWriter out=resp.getWriter();
		 
		//JDBC Implementation
		StudentDAO sdao=new StudentDAOImp();
		Student s1= sdao.getStudent(phone, mail);
		if(s1!=null && password.equals(confirmPassword)) {
			s1.setPass(confirmPassword);
			boolean result=sdao.updateStudent(s1);
			if(result) {
				req.setAttribute("success", "pin updated successfully");
				RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
				rd.forward(req, resp);
				//out.println("<h1>Password updated successfully</h1>");
			}
			else {
				req.setAttribute("failure", "failed to update the pin");
				RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
				rd.forward(req, resp);
				//out.println("<h1>Failed to update the password</h1>");
			}
		}
		else {
			req.setAttribute("failure", "invalid credential");
			RequestDispatcher rd = req.getRequestDispatcher("ForgotPin.jsp");
			rd.forward(req, resp);
			//out.println("<h1>invalid credential</h1>");
		}
	}
}

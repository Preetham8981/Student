package com.Student.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.Student.DAO.StudentDAO;
import com.Student.DAO.StudentDAOImp;
import com.Student.DTO.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateAccount")

public class UpdateAccount extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//collect the data from user
		String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		//conversion of datatypes
		long phone=Long.parseLong(phonenumber);
		String mail=req.getParameter("mail");
		String branch=req.getParameter("branch");
		String loc=req.getParameter("loc");
		
		PrintWriter out=resp.getWriter();
		
		//using previously created session object
		HttpSession session = req.getSession(false); 
		
		//JDBC Implementation
		StudentDAO sdao=new StudentDAOImp();
		Student s = (Student)session.getAttribute("student");
		
		if(s!=null) {
			s.setName(name);
			s.setPhone(phone);
			s.setMail(mail);
			s.setBranch(branch);
			s.setLocation(loc);
			
			boolean result=sdao.updateStudent(s);
			if(result) {
				req.setAttribute("success", "Account updated successfully");
				RequestDispatcher rd = req.getRequestDispatcher("UpdateAccount.jsp");
				rd.forward(req, resp);
				//out.println("<h1>Password updated successfully</h1>");
			}
			else {
				req.setAttribute("failure", "failed to update the Account");
				RequestDispatcher rd = req.getRequestDispatcher("UpdateAccount.jsp");
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

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

@WebServlet("/login1")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//collect the data from the user 
		String mail=req.getParameter("mail");
		String password=req.getParameter("password");
		PrintWriter out=resp.getWriter();
		
		//creating session object
		HttpSession session = req.getSession(); 
		 
		//jdbc implementation
		StudentDAO sdao=new StudentDAOImp();
		Student s=sdao.getStudent(mail, password);
		if(s!=null) {
			session.setAttribute("student", s);
			RequestDispatcher rd = req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Login successful, Welcome "+s.getName()+"</h1>"+"<br>"+ "<a href=\"Login.html\">Back</a>");
		}
		else {
			req.setAttribute("failure", "Failed to Login");
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Invalid mail or password!</h1>"+ "<br>"+ "<a href=\"Login.html\">Back</a>");
		 }

	}
}

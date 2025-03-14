package com.Student.Servlets;

import java.io.IOException;

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

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String Did = req.getParameter("id");
		int id = Integer.parseInt(Did);
		
		
		//creating session object
		HttpSession session = req.getSession(false);
		
		//JDBC Implementation
		StudentDAO sdao=new StudentDAOImp();
		Student s = (Student)session.getAttribute("student");
		if(id!=1) {
			boolean s2=sdao.deleteStudent(id);
			if(s2) {
				req.setAttribute("success","Deleted Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("ViewData.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Failed to delete");
				RequestDispatcher rd=req.getRequestDispatcher("ViewData.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			
			req.setAttribute("failure", "admin can't be deleted");
			RequestDispatcher rd=req.getRequestDispatcher("ViewData.jsp");
			rd.forward(req, resp);
		}

	}
}

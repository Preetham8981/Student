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

@WebServlet("/search")

public class Search extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = req.getParameter("id");
		int id = Integer.parseInt(sid);
		System.out.println(sid);
		
		//creating session object
		HttpSession session = req.getSession(false);
				
		//JDBC Implementation
				StudentDAO sdao=new StudentDAOImp();
				Student s1= sdao.getStudent(id);
				if(s1!=null ) {
					req.setAttribute("searchid", s1);
					RequestDispatcher rd = req.getRequestDispatcher("ViewData.jsp");
					rd.forward(req, resp);
				}
				else {
					req.setAttribute("failure", "Id not found");
					RequestDispatcher rd = req.getRequestDispatcher("ViewData.jsp");
					rd.forward(req, resp);
					//out.println("<h1>invalid credential</h1>");
				}
		
	}
}

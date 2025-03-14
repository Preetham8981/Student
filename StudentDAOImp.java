package com.Student.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Factory.Pac.ConnectionFactory;
import com.Student.DTO.Student;

public class StudentDAOImp implements StudentDAO{

	private Connection con;
	
	
	public StudentDAOImp() {
		this.con = ConnectionFactory.requestConnection();
	}

	@Override
	public boolean insertStudent(Student s) {
		
		//JDBC logics for insert operation
		String query="INSERT INTO Company_1.student VALUES(0,?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps=null;
		int res=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getBranch());
			ps.setString(5,s.getLocation());
			ps.setString(6, s.getPass());
		 
			res=ps.executeUpdate();       //res stores the value whether the data inserted or not
		  
		} 
		 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateStudent(Student s) {
		// TODO Auto-generated method stub
		String query="UPDATE Company_1.student SET NAME=?, PHONE=?, MAILID=?, BRANCH=?, LOCATION=?, PASSWORD=? WHERE ID=?";
		int res=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6, s.getPass());
			ps.setInt(7, s.getId());
			
			res=ps.executeUpdate(); 
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}
		else {
			return false;
		}
		
	}

	public boolean deleteStudent(int s) {
		// TODO Auto-generated method stub
		String query="DELETE FROM Company_1.student WHERE ID=?";
		int res=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1,s);
			//ps.setLong(2,s.getPhone());
			//ps.setString(3, s.getMail());
			//ps.setString(4, s.getBranch());
			//ps.setInt(5, s.getLid());
			//ps.setString(6, s.getPass());
		
			res=ps.executeUpdate();
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public Student getStudent(String mail, String pass) {
		// TODO Auto-generated method stub
		String query="SELECT * FROM Company_1.student WHERE MAILID=? AND PASSWORD=?";
		Student s=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				//String name=rs.getString("name");
				//s.setName(name);
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPass(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}

		return s;
	}

	@Override
	public List<Student> getStudent() {
		// TODO Auto-generated method stub
		ArrayList<Student> students=new ArrayList<Student>();
		Student s=null;
		String query="SELECT * FROM Company_1.student";
		PreparedStatement ps=null;
		ResultSet rs=null; 
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				//String name=rs.getString("name");
				//s.setName(name);
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPass(rs.getString("password"));
				s.setDate(rs.getString("date"));
				students.add(s);
			}
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	@Override
	public void choice() {
		// TODO Auto-generated method stub
		System.out.println("1. Insert Student");
		System.out.println("2. Update Student");
		System.out.println("3. Delete Student");
		System.out.println("4. Get Respective Student");
		System.out.println("5. Get all the Student");
	}

	@Override
	public Student getStudent(long phone, String mail) {
		String query="SELECT * FROM STUDENT WHERE PHONE=? AND MAILID=?";
		Student s=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				//String name=rs.getString("name");
				//s.setName(name);
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPass(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public Student getStudent(int id) {
		String query="SELECT * FROM STUDENT WHERE ID=?";
		Student s= null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				//String name=rs.getString("name");
				//s.setName(name);
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPass(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
		
	}
	
}

package com.Student.DAO;

import java.util.List;

import com.Student.DTO.Student;

public interface StudentDAO {
	public boolean insertStudent(Student s);
	public boolean updateStudent(Student s);
	public boolean deleteStudent(int s);
	public Student getStudent(String mail,String pass);
	public Student getStudent(long phone, String mail);
	public Student getStudent(int id);
	public List<Student> getStudent();
	public void choice();
}

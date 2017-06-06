package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ClassMsDAO;
import db.DeptMsDAO;
import db.TeacherMsDAO;

/**
 * Servlet implementation class StuDetailServlet
 */
@WebServlet("/StuDetailServlet")
public class StuDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决中文乱码
        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("text/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        //得到type的值
        String type = request.getParameter("type");
        
        String result = "";
        
        if(type.equals("dept")) {
        	String deptID = request.getParameter("deptID");
        	DeptMsDAO deptDao = new DeptMsDAO();
        	try {
				result = deptDao.getDeptName(deptID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			deptDao.close();
        }
        else if(type.equals("class")) {
        	String classID = request.getParameter("classID");
	        ClassMsDAO classDao = new ClassMsDAO();
			try {
				result = classDao.getClassName(classID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			classDao.close();
        }
        else if(type.equals("teacher")) {
        	String teacherID = request.getParameter("teacherID");
        	TeacherMsDAO teacherDao = new TeacherMsDAO();
			try {
				result = teacherDao.getTeacherName(teacherID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			teacherDao.close();
        }

        PrintWriter out = response.getWriter();
        out.write(result);
        out.flush();
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

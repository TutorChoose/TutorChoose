package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ClassMsDAO;
import db.StudentMsDAO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class PageCountServlet
 */
@WebServlet("/PageCountServlet")
public class PageCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCountServlet() {
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

        //得到keyword的值
        String searchType = request.getParameter("searchType");
        String searchCondiction = request.getParameter("searchCondiction");
        
        StudentMsDAO studentDao=new StudentMsDAO();  
        int pageSize=4;// 每页显示的记录
        int totalpages = studentDao.getTotalPage(pageSize, searchType, searchCondiction);
        studentDao.close();

        PrintWriter out = response.getWriter();
        out.write(String.valueOf(totalpages));
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

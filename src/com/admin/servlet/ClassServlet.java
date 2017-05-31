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
import net.sf.json.JSONArray;

/**
 * Servlet implementation class ClassServlet
 */

public class ClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassServlet() {
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
        String deptID = request.getParameter("deptID");
        
        JSONArray jsonArrayResult = new JSONArray();
        
        ClassMsDAO classDao = new ClassMsDAO();
		ArrayList<Map<String, String>> classMsgs = classDao.queryClassByDeptID(deptID);
		for (Map<String, String> classMsg : classMsgs) {
			jsonArrayResult.add(classMsg);
		}
		
		System.out.println(jsonArrayResult);

        PrintWriter out = response.getWriter();
        out.write(jsonArrayResult.toString());
        out.flush();
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

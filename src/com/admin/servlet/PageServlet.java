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

import db.StudentMsDAO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class ClassServlet
 */

public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
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
        
//        JSONArray jsonArrayResult = new JSONArray();
//        
//        ClassMsDAO classDao = new ClassMsDAO();
//		ArrayList<Map<String, String>> classMsgs = classDao.queryClassByDeptID(deptID);
//		for (Map<String, String> classMsg : classMsgs) {
//			jsonArrayResult.add(classMsg);
//		}
//        System.out.println(jsonArrayResult);
//
//        PrintWriter out = response.getWriter();
//        out.write(jsonArrayResult.toString());
//        out.flush();
//        out.close();
        
		StudentMsDAO studentDao=new StudentMsDAO();  
        int pageSize=4;// 每页显示的记录  
        int totalpages=studentDao.getTotalPage(pageSize); // 最大页数
        // 得到当前的页数
        String currentPage=request.getParameter("pageIndex"); 
        if(currentPage==null){  
            currentPage="1";  
        }  
        int pageIndex=Integer.parseInt(currentPage);  
        // 添加逻辑判断，防止页数异常  
        if(pageIndex<1){  
            pageIndex=1;  
        }else if(pageIndex>totalpages){  
            pageIndex=totalpages;  
        } 
        
        ArrayList<Map<String, String>> studentMsgs = studentDao.findOnePageStudent(pageSize,pageIndex);
    	  for (Map<String, String> studentMsg : studentMsgs) { 
           String StuID = studentMsg.get("stuid");  
           String StuName = studentMsg.get("stuname");
    	}
        studentDao.close(); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

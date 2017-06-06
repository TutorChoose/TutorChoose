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
        
		StudentMsDAO studentDao=new StudentMsDAO();  
        int pageSize=4;// 每页显示的记录  
       
        String searchType = "";
        String searchCondiction = "";
        if(request.getParameter("searchType")!=null && request.getParameter("searchCondiction")!=null){
        	searchType = request.getParameter("searchType");
            searchCondiction = request.getParameter("searchCondiction");
        }
        
        int totalpages=studentDao.getTotalPage(pageSize, searchType, searchCondiction); // 最大页数
       
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
        
        JSONArray jsonArrayResult = new JSONArray();
        ArrayList<Map<String, String>> studentMsgs = studentDao.findOnePageStudent(pageSize,pageIndex, searchType, searchCondiction);
	    for (Map<String, String> studentMsg : studentMsgs) { 
		  jsonArrayResult.add(studentMsg);
	    }
        studentDao.close(); 
       // response.sendRedirect(request.getContextPath()+"/admin/pageTest.jsp");
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

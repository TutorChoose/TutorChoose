package com.stu.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.StudentDAO;

@WebServlet("/student/ChangePwd")
public class ChangePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePwd() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//鑾峰緱瀛︾敓瀛﹀彿鍜屽瘑鐮�
		request.setCharacterEncoding("utf8");
		HttpSession session=request.getSession();
		String stuId = (String)session.getAttribute("stuId");
		StudentDAO so = new StudentDAO();
		if(request.getParameter("newPassword") != null){
			String stuPwd = request.getParameter("newPassword");
			int num = so.changeStuPassword(stuId, stuPwd);
			if(num > 0){
				//鎴愬姛淇敼
				session.setAttribute("stuPwd", stuPwd);
				request.setAttribute("stuPwd", stuPwd);
				session.setAttribute("result", "修改密码成功");
				session.setAttribute("isError", "0");
				response.sendRedirect("setting.jsp");
	//			request.getRequestDispatcher("student/setting.jsp").forward(request, response);  
			}
			else{
				//淇敼澶辫触,閿欒鎻愰啋
				session.setAttribute("result", "修改密码失败");
				session.setAttribute("isError", "1");
				response.sendRedirect("setting.jsp");
	//			request.getRequestDispatcher("student/setting.jsp").forward(request, response);  			
			}
		}
		else{
			//淇敼鑱旂郴鏂瑰紡鍜岀畝浠�
			String tel = request.getParameter("studentTel");
			String intro = request.getParameter("studentIntro");
			intro = new String(intro.getBytes("ISO-8859-1"), "UTF-8");
			int num = so.updateInfo(stuId, tel, intro);
			if(num > 0){
				//淇敼session鍐呬繚瀛樼殑stuinfo
				Map<String,String> ot = so.studentInfo(stuId);
				session.setAttribute("stuInfo",ot);
				session.setAttribute("result", "个人信息修改成功");
				session.setAttribute("isError" , "0");
				response.sendRedirect("setting.jsp");
			}else{
				session.setAttribute("result", "个人信息修改失败");
				session.setAttribute("isError", "1");
				response.sendRedirect("setting.jsp");
			}
		}
	}

}

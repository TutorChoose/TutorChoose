package com.admin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.AdminMsDAO;
import db.ClassMsDAO;
import db.DeptMsDAO;
import db.StudentMsDAO;
import db.TeacherMsDAO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/admin/AddStudentInfoServlet")
public class AddInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//���´���������ȡ�����ݹ���������
		String result = "";
		request.setCharacterEncoding("UTF-8"); 
		String userType= request.getParameter("userType");
		HttpSession session = request.getSession();
		session.setAttribute("clickType", userType);
		switch(userType){
			case "teacher":
				//System.out.println("��ʼ������ʦ");
				TeacherMsDAO teacherDao = new TeacherMsDAO();
				String TeacherID = request.getParameter("TeacherID");
			    String TeacherName=request.getParameter("TeacherName");
			    String Sex=request.getParameter("Sex");
			    String Title=request.getParameter("Title");
			    String DeptID=request.getParameter("DeptID");
		        String tel=request.getParameter("tel");
		        String Intro=request.getParameter("Intro");
		        if(teacherDao.findByTeacherID(TeacherID)!=null){
			    	session.setAttribute("isError", "1");
			    	result = "��ʦ����Ϊ"+TeacherID+"�������Ѵ���";
			    } else {
			        // ���뵽���ݿ�
			        int i = teacherDao.addTeacher(TeacherID,TeacherName,DeptID,Sex,Title,tel,Intro);
				    if (i > 0) {
				    	session.setAttribute("isError", "0");
				    	result = "�ɹ��޸Ľ�ʦ"+TeacherName+"����Ϣ";
					} else {
						session.setAttribute("isError", "1");
				    	result = "�޸Ľ�ʦ"+TeacherName+"����Ϣʧ��";
					}
			    }
		        teacherDao.close();
			    session.setAttribute("result", result);
			    response.sendRedirect(request.getContextPath()+"/admin/homepage.jsp");
				break;
			case "student":
				StudentMsDAO stuDao = new StudentMsDAO();
				ClassMsDAO classDao = new ClassMsDAO();
				String StuID = request.getParameter("StuID");
				String StuName=request.getParameter("StuName");
			    DeptID=request.getParameter("DeptID");
			    String ClassID=request.getParameter("ClassID");
		        Sex=request.getParameter("Sex");
		        float Grade=Float.parseFloat(request.getParameter("Grade"));
		        tel=request.getParameter("tel");
		        Intro=request.getParameter("Intro");
		        if(stuDao.findOneStudent(StuID)!=null){
			    	session.setAttribute("isError", "1");
			    	result = "ѧ��ѧ��Ϊ"+StuID+"�������Ѵ���";
			    } else {
			        // ���뵽���ݿ�
			        i = stuDao.addStudent(StuID,StuName,DeptID,ClassID,Sex,Grade,tel,Intro);
				    if (i > 0) {
				    	session.setAttribute("isError", "0");
				    	result = "�ɹ�����ѧ��"+StuName+"������";
				    	//System.out.println("�ɹ�����ѧ��"+StuName+"������");
					} else {
						session.setAttribute("isError", "1");
				    	result = "����ѧ��"+StuName+"����Ϣʧ��";
					}
			    }
		        classDao.close();
		        stuDao.close();
			    session.setAttribute("result", result);
			    response.sendRedirect(request.getContextPath()+"/admin/homepage.jsp");
				break;
			case "dept":
				DeptMsDAO deptDao = new DeptMsDAO();
			    DeptID=request.getParameter("DeptID");
			    String deptName=request.getParameter("DeptName");
			    if(deptDao.findOneDept(DeptID)!=null){
			    	session.setAttribute("isError", "1");
			    	result = "ϵ���Ϊ"+DeptID+"�������Ѵ���";
			    } else {
			    	// ���뵽���ݿ�
			    	i = deptDao.addDept(DeptID,deptName);
				    if (i > 0) {
				    	session.setAttribute("isError", "0");
				    	result = "�ɹ�����ϵ"+deptName+"������";
					} else {
						session.setAttribute("isError", "1");
				    	result = "����ϵ"+deptName+"����Ϣʧ��";
					}
			    }
			    deptDao.close();
			    session.setAttribute("result", result);
			    response.sendRedirect(request.getContextPath()+"/admin/homepage.jsp");
				break;
			case "class":
				classDao = new ClassMsDAO();
			    ClassID=request.getParameter("ClassID");
			    String className=request.getParameter("ClassName");
			    DeptID=request.getParameter("DeptID");
			    if(classDao.findOneClass(ClassID)!=null){
			    	session.setAttribute("isError", "1");
			    	result = "�༶���Ϊ"+ClassID+"�������Ѵ���";
			    } else {
					// ���뵽���ݿ�
			        i = classDao.addClass(ClassID, className, DeptID);
				    if (i > 0) {
				    	session.setAttribute("isError", "0");
				    	result = "�ɹ�����༶"+className+"������";
					} else {
						session.setAttribute("isError", "1");
				    	result = "����༶"+className+"����Ϣʧ��";
					}
			    }
			    classDao.close();
			    session.setAttribute("result", result);
			    response.sendRedirect(request.getContextPath()+"/admin/homepage.jsp");
				break;
			case "admin":
				AdminMsDAO adminDao = new AdminMsDAO();
			    String adminID=request.getParameter("AdminID");
			    String adminName=request.getParameter("AdminName");
			    String aPassword=request.getParameter("APassword");
			    tel=request.getParameter("tel");
			    if(adminDao.findOneAdmin(adminID)!=null){
			    	session.setAttribute("isError", "1");
			    	result = "����Ա���Ϊ"+adminID+"�������Ѵ���";
			    } else {
					// ���뵽���ݿ�
			        i = adminDao.addAdmin(adminID, adminName, aPassword,tel);
				    if (i > 0) {
				    	session.setAttribute("isError", "0");
				    	result = "�ɹ��������Ա"+adminName+"������";
					} else {
						session.setAttribute("isError", "1");
				    	result = "�������Ա"+adminName+"����Ϣʧ��";
					}
			    }
			    adminDao.close();
			    session.setAttribute("result", result);
			    response.sendRedirect(request.getContextPath()+"/admin/homepage.jsp");
				break;
			default:
				break;
		}
	}
}

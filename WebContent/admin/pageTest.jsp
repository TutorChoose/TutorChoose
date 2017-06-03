<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page import="db.StudentMsDAO"%>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>Oracle 分页 </title>  
  </head>  
  <body>  
      <%@ include file="navbar.jsp"%>
      <%  
        StudentMsDAO studentDao=new StudentMsDAO();  
        int pageSize=4;// 每页显示的记录  
        int totalpages=studentDao.getTotalPage(pageSize); // 最大页数  
        String currentPage=request.getParameter("pageIndex"); // 获得当前的页数，即第几页 
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
      %>  
      <!-- 循环显示员工的数据 -->  
       <table border="1">  
          <tr>  
             <td> 学号 </td>  
             <td> 学生姓名 </td>  
          </tr>  
      <%  
      ArrayList<Map<String, String>> studentMsgs = studentDao.findOnePageStudent(pageSize,pageIndex);
  	  for (Map<String, String> studentMsg : studentMsgs) {
       %>   
         <tr>  
            <td><%=studentMsg.get("stuid") %></td>  
            <td><%=studentMsg.get("stuname") %></td>
         </tr>  
      <% }%>  
    </table>    
         <div>
           <nav aria-label="Page navigation"
				style="width:1600px;position:absolute;left:1010px;top:780px">
			 <ul class="pagination">
				<li><a href="stuTeamInfo.jsp?page=<%=pageIndex - 1%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
					for (int i = 0; i < totalpages; i++) {
				%>

				<li><a href="pageTest.jsp?pageIndex=<%=i+1 %>"> <%=i+1 %></a></li>
				<%
					}
				%>
				<li><a href="stuTeamInfo.jsp?page=<%=pageIndex + 1%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
			</nav>
        </div>
     <%studentDao.close(); %> 
  </body>  
</html>  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page import="db.StudentMsDAO"%>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>Oracle 分页 </title>  
  </head>  
  <body>  
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
         <a href="pageTest.jsp?pageIndex=1"> 首页 </a>   
         <a href="pageTest.jsp?pageIndex=<%=pageIndex-1 %>"> 上一页 </a>  
         <a href="pageTest.jsp?pageIndex=<%=pageIndex+1 %>"> 下一页 </a>  
         <a href="pageTest.jsp?pageIndex=<%=totalpages%>"> 末页 </a>  
         <br/>  
         <p style='color:red'> 当前页数:<%=pageIndex%></p> 
     <%studentDao.close(); %> 
  </body>  
</html>  
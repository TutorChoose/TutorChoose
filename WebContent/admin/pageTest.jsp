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
        //String searchType = "searchById";
        //String searchCondiction = "40201";
        int totalpages=studentDao.getTotalPage(pageSize, "", ""); // 最大页数  
     %>  
     <!-- 循环显示员工的数据 -->  
     <table border="1"> 
     	<thead>  
     		<tr>
	        	<th> 学号 </th>  
	           	<th> 学生姓名 </th> 
           	</tr>   
       	</thead>
        <tbody id="tableBody">
	     <%  
	      ArrayList<Map<String, String>> studentMsgs = studentDao.findOnePageStudent(pageSize,1,"","");
	  	  for (Map<String, String> studentMsg : studentMsgs) {
	       %>   
	         <tr>  
	            <td><%=studentMsg.get("stuid") %></td>  
	            <td><%=studentMsg.get("stuname") %></td>
	         </tr>  
	      <% }%>  
	    </tbody>
	</table> 
	
	<!-- <form action="page" method="get"> -->
	  searchType: 
	  <select type="text" name="searchType" id="searchType" class="form-controls"/>
	    <option value="searchById">按学号查询</option>
	    <option value="searchByName">按姓名查询</option>
	  </select>
      searchCondiction: <input type="text" name="searchCondiction" id="searchCondiction" class="form-controls"/>
      <button class="btn btn-default" type="button" onClick="searchStu()">search</button>
	<!-- </form> -->
	<ul class="pagination" id="pageNum">
		<li>
			<a aria-label="Previous" onClick="showPage(-1)" style="cursor: pointer">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<%
			for (int i = 0; i < totalpages; i++) {
		%>
		<li><a onClick="showPage('<%=i+1 %>')" style="cursor: pointer"> <%=i+1 %></a></li>
		<%
			}
		%>
		<li>
			<a aria-label="Next" onClick="showPage(-2)" style="cursor: pointer"> 
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
    <%studentDao.close(); %> 
  </body>
  <script>
  	var pageIndex = 1;
  	$(document).ready(function(){
  		$("#pageNum li:eq(1) a").css({"background-color":"#5d9cec","color":"#fff"});
  	});
  	function showPage(index) {
  		if(index == -1) {
            pageIndex--;
        }
        else if(index == -2) {
        	pageIndex++;
        }
        else {
        	pageIndex = index;
        }
  		var searchType = $("select#searchType option:selected").val();
  		var searchCondiction = $("#searchCondiction").val();
  		//对应服务器端程序PageServlet的属性，并将该Servlet中的数据转换为JSON格式
        $.post("page",{searchType: searchType,searchCondiction: searchCondiction,pageIndex: pageIndex},function(data){
            //接收服务器返回的班级 ,data为数组格式
            var objs=eval(data); //解析json对象
            //解析班级的数据，填充到班级下拉框中
            $("#tableBody").html("");
            if (objs.length != 0) {
                for (var i = 0; i < objs.length; i++) {
                	$("<tr><td>"+objs[i].stuid+"</td><td>"+objs[i].stuname+"</td></tr>").appendTo($("#tableBody"));
                }
                $("#pageNum li a").css({"background-color":"#fff","color":"#23527c"});
                $("#pageNum li:eq("+(pageIndex)+") a").css({"background-color":"#5d9cec","color":"#fff"}); 
            } else {
                //没有任何数据
                $("#tableBody").hide();
            }
        }, "json");
  	}
  	function searchStu() {
  		var searchType = $("select#searchType option:selected").val();
  		var searchCondiction = $("#searchCondiction").val();
  		$.post("page",{searchType: searchType,searchCondiction: searchCondiction},function(data){
            //接收服务器返回的班级 ,data为数组格式
            var objs=eval(data); //解析json对象
            //解析班级的数据，填充到班级下拉框中
            $("#tableBody").html("");
            if (objs.length != 0) {
                for (var i = 0; i < objs.length; i++) {
                	$("<tr><td>"+objs[i].stuid+"</td><td>"+objs[i].stuname+"</td></tr>").appendTo($("#tableBody"));
                }
                $("#pageNum li a").css({"background-color":"#fff","color":"#23527c"});
                $("#pageNum li:eq("+(pageIndex)+") a").css({"background-color":"#5d9cec","color":"#fff"}); 
            } else {
                //没有任何数据
                $("#tableBody").hide();
            }
        }, "json");
  		$.ajax({  
	        url : "pageCount",
	        data : {searchType: searchType, searchCondiction: searchCondiction},  // 参数  
	        type : "post",
	        cache : false,
	        dataType : "text", 
	        error: function(){
		        console.log("error");
	        }, 
	        success:function(data){
	        	var newTotalpages = parseInt(data);
	        	if(newTotalpages>0) {
	        		$("#pageNum").html("");
	        		$("<li><a aria-label='Previous' onClick='showPage(-1)' style='cursor: pointer'><span aria-hidden='true'>&laquo;</span></a></li>").appendTo($("#pageNum"));
	        		for (var i = 0; i < newTotalpages; i++) {
	                	$("<li><a onClick='showPage("+(i+1)+")' style='cursor: pointer'>"+(i+1)+"</a></li>").appendTo($("#pageNum"));
	                }
	        		$("<li><a aria-label='Next' onClick='showPage(-2)' style='cursor: pointer'> <span aria-hidden='true'>&raquo;</span></a></li>").appendTo($("#pageNum"));
	        	}
	        }  
	   	});
  	}
  </script>
</html>  
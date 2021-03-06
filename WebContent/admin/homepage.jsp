<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.TeacherMsDAO"%>
<%@ page import="db.StudentMsDAO"%>
<%@ page import="db.DeptMsDAO"%>
<%@ page import="db.ClassMsDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
	DeptMsDAO deptDao = new DeptMsDAO();
	ClassMsDAO classDao = new ClassMsDAO();
	TeacherMsDAO teacherDao = new TeacherMsDAO();
	StudentMsDAO studentDao = new StudentMsDAO();
	%>
	<!-- 添加教师模态框   -->
	<form action="addInfo" method="post" class="form-horizontal" onsubmit="return checkTeacher()">
		<div class="modal fade" id="addTeacherModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="addTeacherModal">添加教师</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="teacher" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">教师编号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写教师编号' name='TeacherID' id='teacherID'/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">教师姓名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写姓名' name='TeacherName' id='teacherName'/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">性别：</label>
						    <div class="col-sm-7">
    							<label class='checkbox-inline'>
    								<input type='radio' name='Sex' value='M' class='sweetalertRadio' checked>男
    							</label>
    							<label class='checkbox-inline'>
    								<input type='radio' name='Sex' class='sweetalertRadio' value='F'>女
    							</label>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">系编号：</label>
						    <div class="col-sm-7">
    							<select name='DeptID' id='DeptID' class='form-control'>
						  	    <%
						  		ArrayList<Map<String, String>> deptMsgs = deptDao.queryDeptAll();
						  	    for (Map<String, String> deptMsg : deptMsgs) { %>
						  	    	<option value =<%=deptMsg.get("deptid") %>>
						  	    	<%=deptMsg.get("deptname") %></option>
						 		<%}%>
						 		</select>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">职称：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写职称' name='Title' id='teacherTitle'/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">电话号码：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写电话号码' name='tel' id='teacherTel'/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">自我介绍：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写自我介绍' name='Intro' id='teacherIntro'/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<!-- 添加学生模态框   -->		  		
	<form action="addInfo" method="post" class="form-horizontal" onsubmit="return checkStudent()">
		<div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="addStudentModal">添加学生</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="student" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">学生学号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写学生学号' name='StuID' id="stuID"/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">学生姓名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写学生姓名' name='StuName' id="stuName"/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">性别：</label>
						    <div class="col-sm-7">
    							<label class='checkbox-inline'>
    								<input type='radio' name='Sex' value='M' class='sweetalertRadio' checked>男
    							</label>
    							<label class='checkbox-inline'>
    								<input type='radio' name='Sex' class='sweetalertRadio' value='F'>女
    							</label>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">系编号：</label>
						    <div class="col-sm-7"> 
    							<select name='DeptID' id='addStuDeptID' class='form-control'>
						  	    <%
						  	    for (Map<String, String> deptMsg : deptMsgs) { %>
						  	    	<option value =<%=deptMsg.get("deptid") %>>
						  	    	<%=deptMsg.get("deptname") %></option>
						 		<%}%>
						 		</select>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">班级编号：</label>
						    <div class="col-sm-7">
    							<select name='ClassID' id='addStuClassID' class='form-control'>
						 		</select>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">绩点：</label>
						    <div class="col-sm-7">
    							<input type='number' class="form-control" placeholder='请填写绩点' name='Grade' id="stuGrade" min='0' max='5'/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">电话号码：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写电话号码' name='tel' id="stuTel"/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">自我介绍：</label>
						    <div class="col-sm-7">
    							<input name='Intro' class="form-control" rows='3' cols='20' id="stuIntro"/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<!-- 添加系模态框   -->
	<form action="addInfo" method="post" class="form-horizontal" onsubmit="return checkDept()">
		<div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="margin-top: 120px">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="addDeptModal">添加系</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="dept" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">系编号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写系编号' name='DeptID' id="deptID"/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">系名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写系名'  name='DeptName' id="deptName"/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<!-- 添加班级模态框   -->
	<form action="addInfo" method="post" class="form-horizontal" onsubmit="return checkClass()">
		<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="margin-top: 120px">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="addClassModal">添加班级</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="class" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">班级编号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写班级编号' name='ClassID' id="classID"/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">系编号：</label>
						    <div class="col-sm-7">
    							<select name='DeptID' id='DeptID' class='form-control'>
						  	    <%for (Map<String, String> deptMsg : deptMsgs) { %>
						  	    	<option value =<%=deptMsg.get("deptid") %>>
						  	    	<%=deptMsg.get("deptname")%>
						  	    	</option>
						 		<%}%>
						 		</select>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">班级名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" placeholder='请填写班级名' name='ClassName' id="className"/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<!-- 编辑系模态框   -->
	<form action="updateInfo" method="post" class="form-horizontal" onsubmit="return checkEditDept()">
		<div class="modal fade" id="editDeptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="margin-top: 120px">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="editDeptModal">编辑系</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="dept" />
		            	<input name="functionType" type="hidden" value="updateInfo" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">系编号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" id="editDeptID" placeholder='请填写系编号' name='DeptID' readonly/>
    						</div>
						</div>
						<div class="form-group">
						    <label class="col-sm-4 control-label">系名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" id="editDeptName" placeholder='请填写系名'  name='DeptName'/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<!-- 编辑班级模态框   -->
	<form action="updateInfo" method="post" class="form-horizontal" onsubmit="return checkEditClass()">
		<div class="modal fade" id="editClassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="margin-top: 120px">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="editClassModal">编辑班级</h4>
		            </div>
		            <div class="modal-body">
		            	<input name="userType" type="hidden" value="class" />
		            	<input name="functionType" type="hidden" value="updateInfo" />
			            <div class="form-group">
						    <label class="col-sm-4 control-label">班级编号：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" id="editClassID" placeholder='请填写班级编号' name='ClassID' readonly/>
    						</div>
						</div>
						<input type="hidden" name="DeptID" id="currentClassDeptID"/>
						<div class="form-group">
						    <label class="col-sm-4 control-label">班级名：</label>
						    <div class="col-sm-7">
    							<input type='text' class="form-control" id="editClassName" placeholder='请填写班级名' name='ClassName'/>
    						</div>
						</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button type="submit" class="btn btn-primary">确定</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	</form>
	
	<span class="nav">管理员端>>信息中心</span>
	<div class="main">
		<div class="htmleaf-container">
			<div class="container">
				<div class="tab-group">
					<section id="tab1" title="系列表">
						<h3>系列表</h3>
						<p>
						<div id="deptListForm">
							<form action="uploadFile" method="post" name="formDept" id="formDept"  onsubmit="return validate(formDept)"
							enctype="multipart/form-data"  onsubmit="console.log('1');" class="fileForm pull-left">
							     导入系信息： 
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importDeptFile" onchange="importFileFun(importDeptFile, deptFileName)"/>
								</a>
								<input class="fileName" id="deptFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="dept" id="deptid"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
							    <button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addDeptModal">添加系</button>
								<button class="btn btn-info exportInfo"
									onClick="window.location.href='exportData?datatype=dept'">导出系</button>
							</div>
							<table id="dept" class="display" cellspacing="0" width="100%">
								<thead>
									<th>系编号</th>
									<th>系名</th>
									<th>编辑系</th>
									<!-- <th>删除</th> -->
							</table>
						</div>
						</p>
					</section>
					<section id="tab2" title="班级列表">
						<h3>班级列表</h3>
						<p>
						<div id="classListForm">
							<form action="uploadFile" method="post" name="formClass" id="formClass"
							enctype="multipart/form-data"  onsubmit="return validate(formClass)" class="fileForm pull-left">
							     导入班级信息： 
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importClassFile" onchange="importFileFun(importClassFile, classFileName)"/>
								</a>
								<input class="fileName" id="classFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="class"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
							    <button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addClassModal">添加班级</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=class'">导出班级</button>
							</div>
							<table id="class" class="display" cellspacing="0" width="100%">
								<thead>
									<th>班级编号</th>
									<th>班级名</th>
									<th>编辑班级</th>
									<!-- <th>删除</th> -->
							</table>
						</div>
						</p>
					</section>
					<section id="tab3" title="教师列表">
						<h3>教师列表</h3>
						<p>
						<div id="teacherListForm">
							<form action="uploadFile" method="post" name="formTeacher" id="formTeacher"
							enctype="multipart/form-data" onsubmit="return validate(formTeacher)" class="fileForm pull-left">
							     导入教师信息：
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importTeacherFile" onchange="importFileFun(importTeacherFile, teacherFileName)"/>
								</a>
								<input class="fileName" id="teacherFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="teacher"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
						    	<button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addTeacherModal">添加教师</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=teacher'">导出教师</button>
						    </div>
							<table id="teacher" class="display" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>工号</th>
										<th>姓名</th>
										<th>系名</th>
										<th>性别</th>
										<th>职称</th>
										<th>已选/限选人数</th>
										<th>是否具有反选资格</th>
										<th>详情</th>
										<!-- <th>删除</th> -->
									</tr>
								</thead>
							</table>
						</div>
						</p>
					</section>
					<section id="tab4" title="学生列表">
						<h3>学生列表</h3>
						<p>
						<div id="studentListForm">
							<form action="uploadFile" method="post" name="formStudent" id="formStudent"
							enctype="multipart/form-data" onsubmit="return validate(formStudent)" class="fileForm pull-left">
							   导入学生信息：
								<a href="javascript:;" class="file">选择文件
								    <input type="file" name="file" id="importStudentFile" onchange="importFileFun(importStudentFile, studentFileName)"/>
								</a>
								<input class="fileName" id="studentFileName" value="未选择文件" disabled/>
								<input type="hidden" name="uploadType" value="student"/>
								<input type="submit" name="Submit" value="确定" class="btn btn-primary importFileBtn"/> 
								<input type="reset" name="Submit2" value="重置" class="btn btn-default importFileBtn"/>
						    </form>
						    <div class="pull-right">
						    	<button class="btn btn-info exportInfo" data-toggle="modal" data-target="#addStudentModal">添加学生</button>
								<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=student'">导出学生</button>
						    </div>

							
						     <div class="pull-right" style="margin-bottom: 10px">
							     <form class="form-inline" role="form">
									<div class="form-group">
									    <label control-label">类型</label>
								      	<select type="text" name="searchType" id="searchType" class="form-control"/>
										    <option value="searchById">按学号查询</option>
										    <option value="searchByName">按姓名查询</option>
										</select>
									</div>
									<div class="form-group">
										<label class="control-label">关键词</label>
									    <input type="text" name="searchCondiction" id="searchCondiction" class="form-control"/>
									</div>
									<button class="btn btn-default" type="button" onClick="searchStu()">搜索</button>
								 </form>
							 </div>
						     <table> 
						     	<thead>  
						     		<tr>
						     			<th>学号</th>
										<th>姓名</th>
										<th>系名</th>
										<th>班级</th>
										<th>性别</th>
										<th>绩点</th>
										<th>导师</th>
										<th>状态</th>
										<th>修改</th>
										<th>删除</th>
						           	</tr>   
						       	</thead>
						        <tbody id="tableBody">
							      
							    </tbody>
							</table>    
							<ul class="pagination pull-right" id="pageNum">
								
							</ul>
						</div>
						</p>
					</section>
					<section id="tab5" title="未选择导师">
						<div class="non-tutor-title" style="display: flex; justify-content: space-between">
							<h3>未选择导师的学生列表</h3>
							<button class="btn btn-info exportInfo"
								onClick="window.location.href='exportData?datatype=UnSelectStudent'">导出未选择导师学生</button>
						</div>
						<p>
						<div id="classListForm">
							<table id="UnSelectedStudent" class="display" cellspacing="0" width="100%">
								<thead>
									<th>学号</th>
									<th>姓名</th>
									<th>系名</th>
									<th>班级</th>
									<th>性别</th>
									<th>绩点</th>
									<th>电话</th>
							</table>
						</div>
						</p>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var activateTab = function(id) {
	    $(".tab-nav li").filter('.active').removeClass('active');
	    $("section").filter('.active').removeClass('active');
	    $(".tab-nav li").has('a[href="' + id + '"]').addClass('active');
	    $("section").filter(id).addClass('active');
	}
	
	$(function(){
		$('.tab-group').tabify();
		<%
		String clickType = (String)session.getAttribute("clickType");
		if(clickType!=null){
			if(clickType.equals("dept")){
				out.print("activateTab('#tab1');"); 
			}else if(clickType.equals("student")){
				out.print("activateTab('#tab4');"); 
			}else if(clickType.equals("teacher")){
				out.print("activateTab('#tab3');"); 
			}else if(clickType.equals("class")){
				out.print("activateTab('#tab2');"); 
			}
			session.removeAttribute("clickType");
		}
		%>
	})
	
	/*获取从servlet返回的信息，显示成功或失败*/
	<%
	String result = (String)session.getAttribute("result");
	String isError = (String)session.getAttribute("isError");
	if(result != null && isError != null) {
		if(isError.equals("0")) {
	%>
			swal("成功", "<%=result%>", "success");
	<%  } else { %>
			swal("失败", "<%=result%>", "error");
	<%	}
		session.removeAttribute("result");
		session.removeAttribute("isError");
	} %>
	function validate(formID) {
		if (formID.file.value == "") {
			swal("失败", "请选择要上传的文件", "error");
			return false;
		}
	}

	// 验证表单信息
	function importFileFun(fileID, fileNameID) {
		var fileName = $(fileID).val();
		if(fileName==undefined || fileName=="")
			$(fileNameID).val("未选择文件");
		else
			$(fileNameID).val(fileName);
	}
</script>
<script type="text/javascript">
	//系
	var arrayDept = new Array();
	var m=0;
	<%   
	for (Map<String, String> deptMsg : deptMsgs) {
		String  viewDept = "<a href='deptDetail.jsp?deptid="+deptMsg.get("deptid")+"'>"+deptMsg.get("deptname")+"</a>";
		String  editDept = "<button class='btn btn-info' data-toggle='modal' data-target='#editDeptModal' onClick=editDept(\'"+deptMsg.get("deptid")+"\',\'"+deptMsg.get("deptname")+"\')>编辑系</button>";
		//String  deleteDept = "<a class='btn btn-danger' onClick=deleteData(\'"+deptMsg.get("deptid")+"\',\'"+deptMsg.get("deptname")+"\',\'"+"dept"+"\')>删除</a>";
	%>
		var n = new Array(4);
		n[0] = "<%=deptMsg.get("deptid")%>";
		n[1] = "<%=viewDept%>";
		n[2] = "<%=editDept%>";
		<%-- n[3] = "<%=deleteDept%>"; --%>
		arrayDept[m] = n;
		m++;
	<%
	}
	%>
	
	// 班级
	var arrayClass = new Array();
	var m=0;
	<%   
	ArrayList<Map<String, String>> classMsgs = classDao.queryClassAll();
	for (Map<String, String> classMsg : classMsgs) {
		String  viewClass = "<a href='classDetail.jsp?classid="+classMsg.get("classid")+"'>"+classMsg.get("classname")+"</a>";
		String  editClass = "<button class='btn btn-info' data-toggle='modal' data-target='#editClassModal' onClick=editClass(\'"+classMsg.get("classid")+"\',\'"+classMsg.get("classname")+"\',\'"+classMsg.get("deptid")+"\')>编辑班级</button>";
		//String  deleteClass = "<a class='btn btn-danger' onClick=deleteData(\'"+classMsg.get("classid")+"\',\'"+classMsg.get("classname")+"\',\'"+"class"+"\')>删除</a>";
	%>
		var n = new Array(4);
		n[0] = "<%=classMsg.get("classid")%>";
		n[1] = "<%=viewClass%>";
		n[2] = "<%=editClass%>";
	<%-- 	n[3] = "<%=deleteClass%>"; --%>
		arrayClass[m] = n;
		m++;
	<%
	}
	%>
	
	//教师
	var arrayTeacher = new Array();
	var k=0;
	<%   
	ArrayList<Map<String, String>> teacherMsgs = teacherDao.queryTeacherList();
	for (Map<String, String> teacherMsg : teacherMsgs) {
		String  editTeacher = "<a class='btn btn-info' href='teacherDetail.jsp?teacherid="+teacherMsg.get("teacherid")+"'>查看</a>";
		// String  deleteTeacher = "<a class='btn btn-danger' onClick=deleteData(\'"+teacherMsg.get("teacherid")+"\',\'"+teacherMsg.get("teachername")+"\',\'"+"teacherid"+"\')>删除</a>";
      	// String  deleteTeacher = "<button type='button' class='btn btn-danger' onClick='teacherMsg.get('teacherid')'>确定</button>";
		String sex = "";
		if(teacherMsg.get("sex").equals("F")){
			sex="男";
		} else if(teacherMsg.get("sex").equals("M")){
			sex="女";
		} 
		
		String privilege = "";
		if(Integer.parseInt(teacherMsg.get("privilege"))==1){
			privilege="<span class='label label-success'>是</span>";
		} else{
			privilege="<span class='label label-info'>否</span>";
		} 
		String  DeptName = deptDao.getDeptName(teacherMsg.get("deptid"));
		StudentDAO sd = new StudentDAO();
		int cnt = sd.getNumOfStudentsToTeacher(teacherMsg.get("teacherid"));
	%>
		var t = new Array(9);
		t[0] = "<%=teacherMsg.get("teacherid")%>";
		t[1] = "<%=teacherMsg.get("teachername")%>";
		t[2] = "<%=DeptName%>";
		t[3] = "<%=sex%>";
		t[4] = "<%=teacherMsg.get("title")%>";
		t[5] = "<%=cnt%>/<%=teacherMsg.get("studentcount")%>";
		t[6] = "<%=privilege%>";
		t[7] = "<%=editTeacher%>";
		<%-- t[8] = "<%=deleteTeacher%>"; --%>
		arrayTeacher[k] = t;
		k++; 
	<%
	}
	%>
	
	// 学生
	var pageIndex = 1;
	var searchType = "";
	var searchCondiction = "";
	var totalpages = 1;
  	$(document).ready(function(){
  		$("#pageNum li:eq(2) a").css({"background-color":"#5d9cec","color":"#fff"});
  		$("#pElsePre").hide();
  		if(parseInt(totalpages)+2<10){
  			$("#pElseNext").hide();
  		}
  		for(var j=7; j<parseInt(totalpages)+2; j++) {
        	$("#pageNum li:eq("+j+")").hide();
        }
  		/*动态改变分页*/
  		changePagination();
  		
  		/*动态改变表格*/
  		changeTable();
  	});
  	function changeTable() {
  		//对应服务器端程序PageServlet的属性，并将该Servlet中的数据转换为JSON格式
        $.post("page",{searchType: searchType,searchCondiction: searchCondiction,pageIndex: pageIndex},function(data){
            //接收服务器返回的班级 ,data为数组格式
            var objs=eval(data); //解析json对象
            //解析班级的数据，填充到班级下拉框中
            $("#tableBody").html("");
            if (objs.length != 0) {
                for (var i = 0; i < objs.length; i++) {
                	var sex = "";
    				if(objs[i].sex=="F"){
    					sex="男";
    				} else if(objs[i].sex=="M"){
    					sex="女";
    				}
    				
    				var DeptName = "";
    				var ClassName = "";
    				var tutor = "";
    			
    				$.ajax({  
    			        url : "stuDetail",
    			        data : {type: "dept", deptID: objs[i].deptid},  // 参数  
    			        type : "post",
    			        cache : false, 
    			        async: false,
    			        dataType : "text", 
    			        error: function(){
	    			        console.log("error");
    			        }, 
    			        success:function(data){
    			        	DeptName = data;
    			        }  
    			   	});
    				$.ajax({  
    			        url : "stuDetail",
    			        data : {type: "class", classID: objs[i].classid},  // 参数  
    			        type : "post",
    			        cache : false, 
    			        async: false,
    			        dataType : "text", 
    			        error: function(){
	    			        console.log("error");
    			        }, 
    			        success:function(data){
    			        	ClassName = data;
    			        }  
    			   	});

    				if(objs[i].teacherid!=null&&!objs[i].teacherid==""){
    					$.ajax({  
        			        url : "stuDetail",
        			        data : {type: "teacher", teacherID: objs[i].teacherid},  // 参数  
        			        type : "post",
        			        cache : false, 
        			        async: false,
        			        dataType : "text", 
        			        error: function(){
    	    			        console.log("error");
        			        }, 
        			        success:function(data){
        			        	tutor = data;
        			        }  
        			   	});
    				}
    				else {
    					tutor = "无";
    				}
    				
    				var choosedstate = "";
    				if(objs[i].choosedstate=="0"){
    					choosedstate="<span>未选择</span>";
    				} else if(objs[i].choosedstate=="1"){
    					choosedstate="<span>待定</span>";
    				} else if(objs[i].choosedstate=="2"){
    					choosedstate="<span>淘汰</span>";
    				} else if(objs[i].choosedstate=="3"){
    					choosedstate="<span>成功</span>";
    				}
    				
                	$("<tr><td>"+objs[i].stuid+"</td><td>"+objs[i].stuname+"</td><td>"+DeptName+"</td><td>"+ClassName+"</td><td>"+sex+"</td><td>"+objs[i].grade+"</td><td>"+tutor+"</td><td>"+choosedstate
                			+"</td><td><a class='btn btn-info' href='studentDetail.jsp?stuid="+objs[i].stuid+"'>查看</a></td><td><a class='btn btn-danger' onClick=deleteData(\'"+objs[i].stuid+"\',\'"+objs[i].stuname+"\',\'"+"student"+"\')>删除</a></td></tr>").appendTo($("#tableBody"));
                }
                $("#pageNum li a").css({"background-color":"#fff","color":"#23527c"});
                $("#pageNum li:eq("+(parseInt(pageIndex)+1)+") a").css({"background-color":"#5d9cec","color":"#fff"});
                for(var j=2; j<parseInt(pageIndex)+1; j++) {
                	$("#pageNum li:eq("+j+")").show();
                }
                for(var j=pageIndex; j<parseInt(pageIndex)+6; j++) {
                	$("#pageNum li:eq("+j+")").show();
                }
                for(var j=2; j<parseInt(pageIndex)-3; j++) {
                	$("#pageNum li:eq("+j+")").hide();
                }
                for(var j=parseInt(pageIndex)+6; j<parseInt(totalpages)+2; j++) {
                	$("#pageNum li:eq("+j+")").hide();
                }
                if(pageIndex>5) {
                	$("#pElsePre").show();
                }
                else {
                	$("#pElsePre").hide();
                }
                if(parseInt(pageIndex)>parseInt(totalpages)-5) {
                	$("#pElseNext").hide();
                }
                else {
                	$("#pElseNext").show();
                }
                
            } else {
                //没有任何数据
                $("<tr><td colspan='10'>没有任何数据</td></tr>").appendTo($("#tableBody"));
            }
        }, "json");
  	}
  	function changePagination() {
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
	        	totalpages = parseInt(data);
	        	if(totalpages>0) {
	        		$("#pageNum").html("");
	        		$("<li><a aria-label='Previous' onClick='showPage(-1)' style='cursor: pointer'><span aria-hidden='true'>&laquo;</span></a></li>").appendTo($("#pageNum"));
	        		$("<li id='pElsePre'><a type='pre'>...</a></li>").appendTo($("#pageNum"));
	        		for (var i = 0; i < totalpages; i++) {
	                	$("<li><a onClick='showPage("+(i+1)+")' style='cursor: pointer'>"+(i+1)+"</a></li>").appendTo($("#pageNum"));
	                }
	        		$("<li id='pElseNext'><a type='next'>...</a></li>").appendTo($("#pageNum"));
	        		$("<li><a aria-label='Next' onClick='showPage(-2)' style='cursor: pointer'> <span aria-hidden='true'>&raquo;</span></a></li>").appendTo($("#pageNum"));
	        	}
	        	else {
	        		$("#pageNum").html("");
	        	}
	        }  
	   	});
  	}
  	function showPage(index) {
  		if(index == -1) {
  			if(pageIndex > 1) {
            	pageIndex--;
  			}
        }
        else if(index == -2) {
        	if(pageIndex < totalpages) {
        		pageIndex++;
        	}
        }
        else {
        	pageIndex = index;
        }
  		searchType = $("select#searchType option:selected").val();
  		searchCondiction = $("#searchCondiction").val();
  		/*动态改变表格*/
  		changeTable();
  	}
  	
  	function searchStu() {
  		pageIndex = 1;
  		searchType = $("select#searchType option:selected").val();
  		searchCondiction = $("#searchCondiction").val();
  		
  		/*动态改变分页*/
  		changePagination();
  		
  		/*动态改变表格*/
  		changeTable();
  	}
	
	// 未选择导师学生
	var arrayUnSelectedStudent = new Array();
	var m2=0;
	<%   
	ArrayList<Map<String, String>> studentMsgs = studentDao.queryUnSelectStudentList();
	for (Map<String, String> studentMsg : studentMsgs) {
		String sex = "";
		if(studentMsg.get("sex").equals("F")){
			sex="男";
		} else if(studentMsg.get("sex").equals("M")){
			sex="女";
		}
		String  DeptName = deptDao.getDeptName(studentMsg.get("deptid"));
		String  ClassName = classDao.getClassName(studentMsg.get("classid"));
	%>
		var l = new Array(10);
		l[0] = "<%=studentMsg.get("stuid")%>";
		l[1] = "<%=studentMsg.get("stuname")%>";
		l[2] = "<%=DeptName%>";
		l[3] = "<%=ClassName%>";
		l[4] = "<%=sex%>";
		l[5] = "<%=studentMsg.get("grade")%>";
		l[6] = "<%=studentMsg.get("tel")%>";
		arrayUnSelectedStudent[m2] = l;
		m2++;
	<%
	}
	%>
	<%
	deptDao.close();
	classDao.close();
	teacherDao.close();
	studentDao.close();
	%>

	/*datatable表格设定*/
	$(document).ready(function(){
		function dataTable(id, dataArray){
			$(id).DataTable({
				data: dataArray,
				"oLanguage": { 
					"sLengthMenu": "每页显示 _MENU_ 条记录", 
					"sZeroRecords": "抱歉， 没有找到", 
					"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
					"sInfoEmpty": "没有数据", 
					"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
					"sSearch": "搜索",
					"oPaginate": { 
						"sFirst": "首页", 
						"sPrevious": "前一页", 
						"sNext": "后一页", 
						"sLast": "尾页" 
					}, 
				"sZeroRecords": "没有检索到数据",
				"bStateSave": true 
				}
			});
		}
		$('#teacher').DataTable({
			data: arrayTeacher,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "没有检索到数据",
			"bStateSave": true 
			}
		});
		$('#UnSelectedStudent').DataTable({
			data: arrayUnSelectedStudent,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "没有检索到数据",
			//"sProcessing": "<img src='./loading.gif' />",
			"bStateSave": true //保存状态到cookie *************** 很重要 ， 当搜索的时候页面一刷新会导致搜索的消失。使用这个属性就可避免了 
			}
		});
		$('#dept').DataTable({
			data: arrayDept,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "没有检索到数据",
			//"sProcessing": "<img src='./loading.gif' />",
			"bStateSave": true //保存状态到cookie *************** 很重要 ， 当搜索的时候页面一刷新会导致搜索的消失。使用这个属性就可避免了 
			}
		});
		$('#class').DataTable({
			data: arrayClass,
			"oLanguage": { 
				"sLengthMenu": "每页显示 _MENU_ 条记录", 
				"sZeroRecords": "抱歉， 没有找到", 
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据", 
				"sInfoEmpty": "没有数据", 
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)", 
				"sSearch": "搜索",
				"oPaginate": { 
					"sFirst": "首页", 
					"sPrevious": "前一页", 
					"sNext": "后一页", 
					"sLast": "尾页" 
				}, 
			"sZeroRecords": "没有检索到数据",
			//"sProcessing": "<img src='./loading.gif' />",
			"bStateSave": true //保存状态到cookie *************** 很重要 ， 当搜索的时候页面一刷新会导致搜索的消失。使用这个属性就可避免了 
			}
		});
		
		/*添加学生模态框的班级初始化*/
		var deptValue = $("#addStuDeptID").val();
        //如果值不为空，则将下拉框的值传送给服务器
        if (deptValue != "") {
            if (!$("#addStuDeptID").data(deptValue)) {
                //对应服务器端程序ClassServlet的属性，并将该Servlet中的数据转换为JSON格式
                $.post("class",{deptID: deptValue},function(data){
                    //接收服务器返回的班级 ,data为数组格式
                    var objs=eval(data); //解析json对象
                    //解析班级的数据，填充到班级下拉框中
                    $("#addStuClassID").html("");
                    $("<option value=''>请选择班级</option>").appendTo($("#addStuClassID"));
                    if (objs.length != 0) {
                        for (var i = 0; i < objs.length; i++) {
                            $("<option value='" + objs[i].classid + "'>" + objs[i].classname + "</option>").appendTo($("#addStuClassID"));
                        }
                    } else {
                        //没有任何数据
                        //$("#ClassID").hide();
                    }
                    $("#addStuDeptID").data(deptValue, objs);
                }, "json"); 
            }
        } else {
            //如果值为空，那么班级下拉框要隐藏
            $("#addStuClassID").hide();
        }
	});
	$("#addStuDeptID").change(function(){
        var deptValue = $(this).val();
        //如果值不为空，则将下拉框的值传送给服务器
        if (deptValue != "") {
            if (!$(this).data(deptValue)) {
                //对应服务器端程序ClassServlet的属性，并将该Servlet中的数据转换为JSON格式
                $.post("class",{deptID: deptValue},function(data){
                    //接收服务器返回的班级 ,data为数组格式
                    var objs=eval(data); //解析json对象
                    //解析班级的数据，填充到班级下拉框中
                    $("#addStuClassID").html("");
                    $("<option value=''>请选择班级</option>").appendTo($("#addStuClassID"));
                    if (objs.length != 0) {
                        for (var i = 0; i < objs.length; i++) {
                            $("<option value='" + objs[i].classid + "'>" + objs[i].classname + "</option>").appendTo($("#addStuClassID"));
                        }
                    } else {
                        //没有任何系的数据
                        //$("#addStuClassID").hide();
                    }
                    $(this).data(deptValue, objs);
                }, "json"); 
            }
        } else {
            //如果值为空，那么班级下拉框要隐藏
            $("#addStuClassID").hide();
        }
    });
</script>
</html>
$(function() {
    $('#addTeacherModal').modal('hide');
    $('#addStudentModal').modal('hide');
    $('#addDeptModal').modal('hide');
    $('#addClassModal').modal('hide');
    $('#editDeptModal').modal('hide');
    $('#editClassModal').modal('hide');
});
function editClass(classid, classname) {
	$("#editClassID").val(classid.toString());
	$("#editClassName").val(classname.toString());	
}

function editDept(deptid, deptname) {
	$("#editDeptID").val(deptid.toString());
	$("#editDeptName").val(deptname.toString());
}
	
// 删除
function deleteData(id, name, type) {
	swal({
	 	title: "确定删除的"+name+"的数据吗？",
	  	text: "",
	  	type: "warning",
	  	showCancelButton: true,
	  	confirmButtonColor: "#DD6B55",
	  	confirmButtonText: "确定",
	  	cancelButtonText: "取消",
	  	closeOnConfirm: false,
	  	closeOnCancel: true
	},
	function(isConfirm){
	  	if (isConfirm) { //确定
	  		if(type=="class") {
	  			window.location.href="deleteInfo.jsp?dataType=class&id="+id;
	  		}
	  		else if(type=="dept") {
	  			window.location.href="deleteInfo.jsp?dataType=dept&id="+id;
	  		}
	  		else if(type=="teacher") {
	  			window.location.href="deleteInfo.jsp?dataType=teacher&id="+id;
	  		}
	  		else if(type=="student") {
	  			window.location.href="deleteInfo.jsp?dataType=student&id="+id;
	  		}
	  	} else { //取消
	  		
	  	}
	});
}

//form表单提交前验证
function checkTeacher(){
	var teacherID = $('#teacherID').val();
	var teacherName = $('#teacherName').val();
	var teacherTitle = $('#teacherTitle').val();
	if(teacherID == "" || teacherName=="" || teacherTitle==""){
		swal("失败", "教师编号、姓名、职称不能为空", "error");
		return false;
	}
	return true;
}
function checkStudent(){
	var stuID = $('#stuID').val();
	var stuName = $('#stuName').val();
	var stuGrade = $('#stuGrade').val();
	if(stuID == "" || stuName=="" || stuGrade==""){
		swal("失败", "学生编号、姓名、绩点不能为空", "error");
		return false;
	}
	return true;
}
function checkDept(){
	var deptID = $('#deptID').val();
	var deptName = $('#deptName').val();
	if(deptID == "" || deptName==""){
		swal("失败", "系编号、名称不能为空", "error");
		return false;
	}
	return true;
}
function checkClass(){
	var classID = $('#classID').val();
	var className = $('#className').val();
	if(classID == "" || className==""){
		swal("失败", "班级编号、名称不能为空", "error");
		return false;
	}
	return true;
}
function checkEditDept() {
	var editDeptName = $('#editDeptName').val();
	if(editDeptName==""){
		swal("失败", "系名称不能为空", "error");
		return false;
	}
	return true;
}
function checkEditClass(){
	var editClassName = $('#editClassName').val();
	if(editClassName==""){
		swal("失败", "班级名称不能为空", "error");
		return false;
	}
	return true;
}
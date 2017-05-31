$(function() {
    $('#addTeacherModal').modal('hide');
    $('#addStudentModal').modal('hide');
    $('#addDeptModal').modal('hide');
    $('#addClassModal').modal('hide');
    $('#editDeptModal').modal('hide');
    $('#editClassModal').modal('hide');
});
function editClass(classid, classname) {
	$("#classID").val(classid.toString());
	$("#className").val(classname.toString());	
}

function editDept(deptid, deptname) {
	$("#deptID").val(deptid.toString());
	$("#deptName").val(deptname.toString());
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
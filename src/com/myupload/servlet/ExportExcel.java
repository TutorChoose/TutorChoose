package com.myupload.servlet;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;

import db.ClassMsDAO;
import db.DeptMsDAO;
import db.StudentMsDAO;
import db.TeacherMsDAO;
import jxl.SheetSettings;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ExportExcel {
	public static WritableFont font1 =new WritableFont(WritableFont.createFont("微软雅黑"), 10 ,WritableFont.BOLD);
	public static WritableFont font2 =new WritableFont(WritableFont.createFont("微软雅黑"), 9 ,WritableFont.NO_BOLD);
	public static WritableCellFormat wcf = new WritableCellFormat(font1);
	public static WritableCellFormat wcf2 = new WritableCellFormat(font2);
	public static WritableCellFormat wcf3 = new WritableCellFormat(font2);//设置样式，字体
	static DecimalFormat df = new DecimalFormat("#.00");
	
	public static void exportExcel(String pathname, String type) throws WriteException {
	  try {
	    //	打开文件
		WritableWorkbook book = Workbook.createWorkbook(new File(pathname));
	    //	生成名为“第一页”的工作表，参数0表示这是第一页
		WritableSheet sheet = book.createSheet( "sheet 1 " , 0);
		// 设置样式
	    setStyle(sheet, type);
	    // 填写数据
	    switch(type){
			case "teacher":
				setTeacherData(sheet);
				break;	
			case "student":
				setStudentData(sheet);
				break;
			case "dept":
				setDeptData(sheet);
				break;
			case "class":
				setClassData(sheet);
				break;
			default:
				break;
		}
		// 开始写数据
		book.write();
		// 关闭表
		book.close();
	   } catch (IOException e) {
		   e.printStackTrace();
	   }
	}
	
	
	public static void setStyle(WritableSheet sheet, String type) throws WriteException{
		SheetSettings ss = sheet.getSettings();
		ss.setVerticalFreeze(2);  // 设置行冻结前2行
		
		wcf.setAlignment(Alignment.CENTRE);  //平行居中
		wcf.setVerticalAlignment(VerticalAlignment.CENTRE);  //垂直居中
		wcf3.setAlignment(Alignment.CENTRE);  //平行居中
		wcf3.setVerticalAlignment(VerticalAlignment.CENTRE);  //垂直居中
		wcf3.setBackground(Colour.LIGHT_ORANGE);
		wcf2.setAlignment(Alignment.CENTRE);  //平行居中
		wcf2.setVerticalAlignment(VerticalAlignment.CENTRE);  //垂直居中
		
		sheet.mergeCells( 1 , 0 , 13 , 0 ); // 合并单元格  			
	}
	
	static void setTeacherData(WritableSheet sheet) throws WriteException{
		Label titleLabel = new Label( 1 , 0 , "教师表", wcf);
		//	将定义好的单元格添加到工作表中
		sheet.addCell(titleLabel);
		sheet.setRowView(1, 500); // 设置第一行的高度500
		int[] headerArrHight = {13,10,13,13,20,13,20,50};
		String headerArr[] = {"工号","姓名","系","性别","职称","特权","电话","自我介绍"};
		for (int i = 0; i < headerArr.length; i++) {
			sheet.addCell(new Label( i , 1 , headerArr[i],wcf));
			sheet.setColumnView(i, headerArrHight[i]);
		}
		
		int conut = 2;
		TeacherMsDAO teacherDao = new TeacherMsDAO();
		ArrayList<Map<String, String>> teacherMsgs =teacherDao.queryTeacherList();
		for (Map<String, String> teacherMsg : teacherMsgs) {
			sheet.addCell(new Label( 0 , conut , teacherMsg.get("teacherid"), wcf2));
			sheet.addCell(new Label( 1 , conut , teacherMsg.get("teachername") ,wcf2));
			sheet.addCell(new Label( 2 , conut , teacherMsg.get("deptid") ,wcf2));
			sheet.addCell(new Label( 3 , conut , teacherMsg.get("sex"), wcf2));
			sheet.addCell(new Label( 4 , conut , teacherMsg.get("title") ,wcf2));
			sheet.addCell(new Label( 5 , conut , teacherMsg.get("privilege") ,wcf2));
			sheet.addCell(new Label( 6 , conut , teacherMsg.get("tel"), wcf2));
			sheet.addCell(new Label( 7 , conut , teacherMsg.get("intro") ,wcf2));
			sheet.setRowView(conut, 370); // 设置第一行的高度
			conut++;
		}
		teacherDao.close();
	}
	
	static void setStudentData(WritableSheet sheet) throws RowsExceededException, WriteException{
		Label titleLabel = new Label( 1 , 0 , "学生表", wcf);
		//	将定义好的单元格添加到工作表中
		sheet.addCell(titleLabel);
		sheet.setRowView(1, 500); // 设置第一行的高度500
		int[] headerArrHight = {13,10,13,13,13,20,13,20,13,50};
		String headerArr[] = {"学号","姓名","系","班级", "性别","成绩","电话", "导师","自我介绍"};
		for (int i = 0; i < headerArr.length; i++) {
			sheet.addCell(new Label( i , 1 , headerArr[i],wcf));
			sheet.setColumnView(i, headerArrHight[i]);
		}
		
		int conut = 2;
		StudentMsDAO studentDao = new StudentMsDAO();
		ArrayList<Map<String, String>> studentMsgs =studentDao.queryStudentList();
		for (Map<String, String> studentMsg : studentMsgs) {
			sheet.addCell(new Label( 0 , conut , studentMsg.get("stuid"), wcf2));
			sheet.addCell(new Label( 1 , conut , studentMsg.get("stuname") ,wcf2));
			sheet.addCell(new Label( 2 , conut , studentMsg.get("deptid") ,wcf2));
			sheet.addCell(new Label( 3 , conut , studentMsg.get("classid"), wcf2));
			sheet.addCell(new Label( 4 , conut , studentMsg.get("sex") ,wcf2));
			sheet.addCell(new Label( 5 , conut , studentMsg.get("grade") ,wcf2));
			sheet.addCell(new Label( 6 , conut , studentMsg.get("tel"), wcf2));
			sheet.addCell(new Label( 7 , conut , studentMsg.get("teacherid") ,wcf2));
			sheet.addCell(new Label( 8 , conut , studentMsg.get("intro") ,wcf2));
			sheet.setRowView(conut, 370); // 设置第一行的高度
			conut++;
		}
		studentDao.close();
	}
    
	static void setDeptData(WritableSheet sheet) throws WriteException{
		Label titleLabel = new Label( 1 , 0 , "系表", wcf);
		//	将定义好的单元格添加到工作表中
		sheet.addCell(titleLabel);
		sheet.setRowView(1, 500); // 设置第一行的高度500
		int[] headerArrHight = {13,10};
		String headerArr[] = {"系号","系名"};
		for (int i = 0; i < headerArr.length; i++) {
			sheet.addCell(new Label( i , 1 , headerArr[i],wcf));
			sheet.setColumnView(i, headerArrHight[i]);
		}
		
		int conut = 2;
		DeptMsDAO deptDao = new DeptMsDAO();
		ArrayList<Map<String, String>> deptMsgs = deptDao.queryDeptAll();
		for (Map<String, String> deptMsg : deptMsgs) {
			sheet.addCell(new Label( 0 , conut , deptMsg.get("deptid"), wcf2));
			sheet.addCell(new Label( 1 , conut , deptMsg.get("deptname") ,wcf2));
			sheet.setRowView(conut, 370); // 设置第一行的高度
			conut++;
		}
		deptDao.close();
	}
    
	static void setClassData(WritableSheet sheet) throws RowsExceededException, WriteException{
		Label titleLabel = new Label( 1 , 0 , "班级表", wcf);
		//	将定义好的单元格添加到工作表中
		sheet.addCell(titleLabel);
		sheet.setRowView(1, 500); // 设置第一行的高度500
		int[] headerArrHight = {13,10,13};
		String headerArr[] = {"班级编号","班级名", "系号"};
		for (int i = 0; i < headerArr.length; i++) {
			sheet.addCell(new Label( i , 1 , headerArr[i],wcf));
			sheet.setColumnView(i, headerArrHight[i]);
		}
		
		int conut = 2;
		ClassMsDAO classDao = new ClassMsDAO();
		ArrayList<Map<String, String>> classMsgs =classDao.queryClassAll();
		for (Map<String, String> classMsg : classMsgs) {
			sheet.addCell(new Label( 0 , conut , classMsg.get("classid"), wcf2));
			sheet.addCell(new Label( 1 , conut , classMsg.get("classname") ,wcf2));
			sheet.addCell(new Label( 2 , conut , classMsg.get("deptid") ,wcf2));
			sheet.setRowView(conut, 370); // 设置第一行的高度
			conut++;
		}
		classDao.close();
    }

}
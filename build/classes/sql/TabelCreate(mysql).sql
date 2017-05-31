/* 创建数据库 */
create database DB_TeachingMS;
/* 数据库名 */
USE DB_TeachingMS;

/* 导入 */

/* 系 */
CREATE TABLE TB_Dept                  
( DeptID varchar(10) PRIMARY KEY,   -- 系编号, 主键                                    
  DeptName varchar(20) NOT NULL  -- 系名
);
/* 班级 */
CREATE TABLE TB_Class                  
( ClassID VARCHAR(10) PRIMARY KEY,    -- 班级编号, 主键                                 
  ClassName VARCHAR(20) NOT NULL,  --班级名
  DeptID VARCHAR(10) NOT NULL REFERENCES TB_Dept(DeptID) --系编号，外键
);

/* 管理员 */
CREATE TABLE TB_Admin             
( AdminID VARCHAR(16) PRIMARY KEY, -- 管理员编号, 主键
  AdminName VARCHAR(30), --管理员姓名                                  
  APassword VARCHAR(16) NOT NULL DEFAULT "123456", --管理员默认密码
  tel VARCHAR(13), --电话
  PrivilegeModel VARCHAR(3) NOT NULL DEFAULT "off", -- 导师反选模式
  AuthorityModel VARCHAR(3) NOT NULL DEFAULT "off", -- 系统访问权限
  LimitModel VARCHAR(3) NOT NULL DEFAULT "off"  -- 选导师权限
); 

/* 老师 */
CREATE TABLE TB_Teacher                  
<<<<<<< HEAD
( TeacherID VARCHAR(16) PRIMARY KEY,   --老师编号 , 主键                    
  TeacherName VARCHAR(30) NOT NULL,   --老师姓名
  TPassword VARCHAR(16) DEFAULT '123456',   --老师密码
  DeptID VARCHAR(2) NOT NULL REFERENCES TB_Dept(DeptID), --系编号，外键
  Sex VARCHAR(1) NOT NULL DEFAULT 'M',  --性别
  Title VARCHAR(10) NOT NULL  DEFAULT '副教授', --职称
  studentCount INTEGER NOT NULL DEFAULT 5 ,  --学生数量，一般老师是上限，反选老师是最低下限
  Privilege INTEGER NOT NULL DEFAULT 3  , -- 选择规则，3-先到先得，4-按照绩点， 1-表示反选导师， 默认是3，先到先得
  tel VARCHAR(13), --电话
  Intro TEXT --自我介绍
=======
( TeacherID VARCHAR(16) PRIMARY KEY,                                             
  TeacherName VARCHAR(30) NOT NULL,   
  TPassword VARCHAR(16) NOT NULL DEFAULT '123456',  
  DeptID VARCHAR(2) NOT NULL REFERENCES TB_Dept(DeptID),
  Sex VARCHAR(1) NOT NULL DEFAULT 'M',  
  Title VARCHAR(10) NOT NULL  DEFAULT '副教授',
  studentCount INTEGER NOT NULL DEFAULT 5 , 
  Privilege INTEGER NOT NULL DEFAULT 3  ,
  tel VARCHAR(13),
  Intro TEXT
>>>>>>> 934a15e5a36d0a3ba211627e2f9b695790d51d2f
);
/* 限选人数*/
/* 特权 0-表示开启反选模式，
 * 因为特权模式和选择规则不冲突，
 * 所以这个字段可以用3-表示按照先到先得，4-表示按照绩点
 */
/* 学生 */
CREATE TABLE TB_Student                  
<<<<<<< HEAD
( StuID VARCHAR(16) PRIMARY KEY,  --学生编号                                           
  StuName VARCHAR(30) NOT NULL,  --学生姓名            
  DeptID VARCHAR(10) NOT NULL REFERENCES TB_Dept(DeptID), --系编号，外键
  ClassID VARCHAR(6) NOT NULL REFERENCES TB_Class(ClassID), --班级编号，外键
  Sex VARCHAR(1) DEFAULT 'M', --性别
  SPassword VARCHAR(16) DEFAULT '123456', --学生密码
  Grade Double NOT NULL, --绩点
  tel VARCHAR(13), --电话
  Intro TEXT, --自我介绍
  TeacherID VARCHAR(16) DEFAULT null, --教师姓名
  choosedState INTEGER DEFAULT 0, --选择状态
  SelectDate DATETIME DEFAULT NOW() --选择日期
=======
( StuID VARCHAR(16) PRIMARY KEY,                                             
  StuName VARCHAR(30) NOT NULL,                         
  DeptID VARCHAR(10) NOT NULL REFERENCES TB_Dept(DeptID),
  ClassID VARCHAR(6) NOT NULL REFERENCES TB_Class(ClassID),
  Sex VARCHAR(1) NOT NULL DEFAULT 'M',
  SPassword VARCHAR(16) NOT NULL DEFAULT '123456',
  Grade Double NOT NULL,
  tel VARCHAR(13),
  Intro TEXT,
  TeacherID VARCHAR(16) DEFAULT null,
  choosedState INTEGER DEFAULT 0, 
  SelectDate DATETIME DEFAULT NOW()
>>>>>>> 934a15e5a36d0a3ba211627e2f9b695790d51d2f
);     
/* 未选择0 | 待定1 | 淘汰2 | 成功3*/

/* 选择导师的过程中产生，选择记录表 */
/* 学生选择导师表 */
CREATE TABLE TB_SelectTeacher               
( StuID VARCHAR(16) NOT NULL REFERENCES TB_Student(StuID),  --学生学号
  TeacherID VARCHAR(16) NOT NULL REFERENCES TB_Teacher(TeacherID), --教师编号，外键
  SelectDate DATETIME DEFAULT NOW(), --选择日期
  Grade Double NOT NULL, /*绩点*/
  choosedState INTEGER DEFAULT 0, /* 待定0 | 淘汰1 | 成功2*/
  CONSTRAINT PK_StuID_TeacherID PRIMARY KEY (StuID, TeacherID, SelectDate)  --主键
);
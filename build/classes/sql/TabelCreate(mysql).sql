/* �������ݿ� */
create database DB_TeachingMS;
/* ���ݿ��� */
USE DB_TeachingMS;

/* ���� */

/* ϵ */
CREATE TABLE TB_Dept                  
( DeptID varchar(10) PRIMARY KEY,   -- ϵ���, ����                                    
  DeptName varchar(20) NOT NULL  -- ϵ��
);
/* �༶ */
CREATE TABLE TB_Class                  
( ClassID VARCHAR(10) PRIMARY KEY,    -- �༶���, ����                                 
  ClassName VARCHAR(20) NOT NULL,  --�༶��
  DeptID VARCHAR(10) NOT NULL REFERENCES TB_Dept(DeptID) --ϵ��ţ����
);

/* ����Ա */
CREATE TABLE TB_Admin             
( AdminID VARCHAR(16) PRIMARY KEY, -- ����Ա���, ����
  AdminName VARCHAR(30), --����Ա����                                  
  APassword VARCHAR(16) NOT NULL DEFAULT "123456", --����ԱĬ������
  tel VARCHAR(13), --�绰
  PrivilegeModel VARCHAR(3) NOT NULL DEFAULT "off", -- ��ʦ��ѡģʽ
  AuthorityModel VARCHAR(3) NOT NULL DEFAULT "off", -- ϵͳ����Ȩ��
  LimitModel VARCHAR(3) NOT NULL DEFAULT "off"  -- ѡ��ʦȨ��
); 

/* ��ʦ */
CREATE TABLE TB_Teacher                  
<<<<<<< HEAD
( TeacherID VARCHAR(16) PRIMARY KEY,   --��ʦ��� , ����                    
  TeacherName VARCHAR(30) NOT NULL,   --��ʦ����
  TPassword VARCHAR(16) DEFAULT '123456',   --��ʦ����
  DeptID VARCHAR(2) NOT NULL REFERENCES TB_Dept(DeptID), --ϵ��ţ����
  Sex VARCHAR(1) NOT NULL DEFAULT 'M',  --�Ա�
  Title VARCHAR(10) NOT NULL  DEFAULT '������', --ְ��
  studentCount INTEGER NOT NULL DEFAULT 5 ,  --ѧ��������һ����ʦ�����ޣ���ѡ��ʦ���������
  Privilege INTEGER NOT NULL DEFAULT 3  , -- ѡ�����3-�ȵ��ȵã�4-���ռ��㣬 1-��ʾ��ѡ��ʦ�� Ĭ����3���ȵ��ȵ�
  tel VARCHAR(13), --�绰
  Intro TEXT --���ҽ���
=======
( TeacherID VARCHAR(16) PRIMARY KEY,                                             
  TeacherName VARCHAR(30) NOT NULL,   
  TPassword VARCHAR(16) NOT NULL DEFAULT '123456',  
  DeptID VARCHAR(2) NOT NULL REFERENCES TB_Dept(DeptID),
  Sex VARCHAR(1) NOT NULL DEFAULT 'M',  
  Title VARCHAR(10) NOT NULL  DEFAULT '������',
  studentCount INTEGER NOT NULL DEFAULT 5 , 
  Privilege INTEGER NOT NULL DEFAULT 3  ,
  tel VARCHAR(13),
  Intro TEXT
>>>>>>> 934a15e5a36d0a3ba211627e2f9b695790d51d2f
);
/* ��ѡ����*/
/* ��Ȩ 0-��ʾ������ѡģʽ��
 * ��Ϊ��Ȩģʽ��ѡ����򲻳�ͻ��
 * ��������ֶο�����3-��ʾ�����ȵ��ȵã�4-��ʾ���ռ���
 */
/* ѧ�� */
CREATE TABLE TB_Student                  
<<<<<<< HEAD
( StuID VARCHAR(16) PRIMARY KEY,  --ѧ�����                                           
  StuName VARCHAR(30) NOT NULL,  --ѧ������            
  DeptID VARCHAR(10) NOT NULL REFERENCES TB_Dept(DeptID), --ϵ��ţ����
  ClassID VARCHAR(6) NOT NULL REFERENCES TB_Class(ClassID), --�༶��ţ����
  Sex VARCHAR(1) DEFAULT 'M', --�Ա�
  SPassword VARCHAR(16) DEFAULT '123456', --ѧ������
  Grade Double NOT NULL, --����
  tel VARCHAR(13), --�绰
  Intro TEXT, --���ҽ���
  TeacherID VARCHAR(16) DEFAULT null, --��ʦ����
  choosedState INTEGER DEFAULT 0, --ѡ��״̬
  SelectDate DATETIME DEFAULT NOW() --ѡ������
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
/* δѡ��0 | ����1 | ��̭2 | �ɹ�3*/

/* ѡ��ʦ�Ĺ����в�����ѡ���¼�� */
/* ѧ��ѡ��ʦ�� */
CREATE TABLE TB_SelectTeacher               
( StuID VARCHAR(16) NOT NULL REFERENCES TB_Student(StuID),  --ѧ��ѧ��
  TeacherID VARCHAR(16) NOT NULL REFERENCES TB_Teacher(TeacherID), --��ʦ��ţ����
  SelectDate DATETIME DEFAULT NOW(), --ѡ������
  Grade Double NOT NULL, /*����*/
  choosedState INTEGER DEFAULT 0, /* ����0 | ��̭1 | �ɹ�2*/
  CONSTRAINT PK_StuID_TeacherID PRIMARY KEY (StuID, TeacherID, SelectDate)  --����
);
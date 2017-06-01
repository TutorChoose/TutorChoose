package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.mysql.jdbc.PreparedStatement;

public class MsDAO {
	DBConnection dbCon;
	private PreparedStatement psmt=null;  
    private ResultSet rs=null;
	String sql = "";
	
	// ��ʼ�����������ݿ�
    public MsDAO(){
		dbCon=new DBConnection();//���ݿ����Ӷ���
		dbCon.createConnection();
	}
    
    // �������ݿ�
    public int updateDB(String sql){
    	int i=dbCon.update(sql);
	    return i;
    }
    
    // �������ݿ�
    public ArrayList<Map<String,String>> queryDBForList(String sql){
		ArrayList<Map<String,String>> list=dbCon.queryForList(sql);
		return list;
	}
    
    // �õ�����ĳ�ű���ܼ�¼��
    public int queryDBForCount(String sql){
		int count=dbCon.queryForCount(sql);
		return count;
	}
    
   // �ر����ݿ�����
 	public void close() {
 		dbCon.close();
 	}
}

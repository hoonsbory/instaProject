package util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.eclipse.jdt.internal.compiler.ast.Statement;

public class JDBCUtil {
	
	// Connection 생성
	public static Connection getConnection(){
		Connection con = null;
		
		try {
			Properties p = new Properties();
			p.load(new FileInputStream("c://lib//dbinfo_scott.txt"));
			
			String driver = p.getProperty("driver");
			String url = p.getProperty("url");
			String user = p.getProperty("user"); 
			String pw = p.getProperty("pw");   
			
			Class.forName(driver);
			con =  DriverManager.getConnection(url, user, pw);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC DRiver 확인 필요");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return con;
	}
	
	// 자원 반납
	public static void close(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}






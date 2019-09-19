package util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
	
	// Connection  생성 메소드
	public static Connection getConnection(){
		Connection con = null;
		
		try {
			Properties properties = new Properties();
			properties.load(new FileInputStream("c://lib//dbinfo.txt"));
			
			String driver = properties.getProperty("driver");
			String url = properties.getProperty("url");
			String user = properties.getProperty("user");
			String pw = properties.getProperty("pw");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC Driver 확인 필요");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return con;
	}

	// 자원 반납 메소드
	public static void close(ResultSet rs, Statement st, Connection con){
		try {
			// 닫는 순서 중요!
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 
}

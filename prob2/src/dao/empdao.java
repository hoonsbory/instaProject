package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.JDBCUtil;
import vo.EmpVO;
import vo.UserVO;

public class empdao {
	public static JSONArray chartemp(){
		String sql = "select round(avg(e.sal)), d.dname from emp e join dept d on e.deptno = d.deptno group by e.deptno,d.dname";
				
				EmpVO vo = new EmpVO();
		JSONArray list = new JSONArray();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			//? 세팅
			//ps.setInt(1, 1);
			//ps.setInt(2, 5);//row 5개씩 가져오겠다. 
			//실행 및 결과값 핸들링
			rs = ps.executeQuery();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("name", rs.getString(2));
				obj.put("y", rs.getInt(1));
				if(obj!=null)
					list.add(obj);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
	public static void main(String[] args) {
		System.out.println(chartemp());
	}
}

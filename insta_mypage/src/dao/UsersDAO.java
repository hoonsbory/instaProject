package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;
import vo.UsersVO;

public class UsersDAO {
	public List<UsersVO> searchAllUsers(){ //모든 유저 정보 검색
		String sql= "select * from users order by email";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UsersVO> list=new ArrayList<UsersVO>();
		try {
			con=JDBCUtil.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				UsersVO vo=new UsersVO();
				vo.setId(rs.getInt("id"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
	
	public boolean loginUser(UsersVO vo){ //로그인-존재 유무 확인
		String sql= "select * from users where email=? and password=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con=JDBCUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getPassword());
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return false;
	}
	
	public int insertUser(UsersVO vo){ //회원가입
		String sql= "insert into users(id,email,password,name) values((select nvl(max(id),0)+1 from users),?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
		try {
			con=JDBCUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			System.out.println(result);
			result=ps.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public int deleteUser(int id) { //회원탈퇴
		String sql= "delete from users where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
		try {
			con=JDBCUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		
		return result;
	}
	
}

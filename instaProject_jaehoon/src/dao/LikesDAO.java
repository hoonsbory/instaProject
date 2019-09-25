package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;
import vo.LikesVO;

public class LikesDAO {
	public int insertLikes(LikesVO vo){
		List<LikesVO> list = new ArrayList<LikesVO>();
		
		String sql = "insert into likes(user_id, post_id) values(?,?);";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, vo.getUser_id());
			ps.setInt(2, vo.getPost_id());
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int deleteLikes(int post_id){
		List<LikesVO> list = new ArrayList<LikesVO>();
		
		String sql = "delete from likes where post_id = ?;";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, post_id);
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
}

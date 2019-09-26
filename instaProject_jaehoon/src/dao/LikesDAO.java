package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;
import vo.CommentsVO;
import vo.LikesVO;
import vo.PostsVO;

public class LikesDAO {
	public int insertLikes(int user_id, int post_id) throws Exception {
		
		String sql = "insert into likes(user_id, post_id) values(?,?)";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, user_id);
			ps.setInt(2, post_id);
			
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int deleteLikes(int post_id, int user_id) throws Exception {
		List<LikesVO> list = new ArrayList<LikesVO>();
		
		String sql = "delete from likes where post_id = ? and user_id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, post_id);
			ps.setInt(2, user_id);
			
			result = ps.executeUpdate();	// update 는 executeUpdate
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public List<LikesVO> countLikes(int post_id) throws Exception {
		List<LikesVO> list = new ArrayList<LikesVO>();
		String sql = "select * from likes where post_id = ? ";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, post_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				list.add(new LikesVO(rs.getInt("user_id"),
									rs.getInt("post_id")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
	
	public int checkMyLike(int post_id, int user_id) throws Exception {
		String sql = "select * from likes where post_id = ? and user_id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count=0;
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, post_id);
			ps.setInt(2, user_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				count++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return count;
	}
}

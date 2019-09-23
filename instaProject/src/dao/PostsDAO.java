package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;
import vo.PostsVO;

public class PostsDAO {
	
	//Select All
	public List<PostsVO> getAllPostsRec(int user_id){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "select img from posts where user_id = ?;";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, user_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				list.add(new PostsVO(rs.getInt("id"),
									rs.getString("content"),
									rs.getInt("user_id"),
									rs.getString("img")));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
		
	}
	
	public int insertPosts(PostsVO vo){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "insert into posts (id, content , img, user_id) values(?,?,?,?);";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, vo.getId());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getImg());
			ps.setInt(4, vo.getUser_id());
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int deletePosts(int id){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "delete from posts where id = ?;";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int updatePosts(PostsVO vo){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "update posts set content = ? where id = ?;";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getContent());
			ps.setInt(2, vo.getId());
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
}

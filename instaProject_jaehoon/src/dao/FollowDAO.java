package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class FollowDAO {
	
	// 팔로우 등록 
	public  int followInsert(int follow, int follower) throws Exception {
		String sql = "insert into follower_map(id , target_id, follower_id) values(?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+Integer.toString(follower));
			ps.setInt(2, follow);
			ps.setInt(3, follower);
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	// 팔로워 취소 
	public  int followDelete(int follow ,int follower) throws Exception {
		String sql = "delete from follower_map where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+Integer.toString(follower));
			result = ps.executeUpdate();
			
			// rs = ps.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int followCheck(int follow, int follower) throws Exception {
		String sql = "select id from follower_map where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+Integer.toString(follower));
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			if(rs.next()) {
				count = 1;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		System.out.println(count);
		return count;
	}
	public List<String> follownum(int myid) throws Exception {
		String sql = "select id from follower_map where target_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, myid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
	public List<String> followernum(int yourid) throws Exception {
		String sql = "select id from follower_map where follower_id =?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		List<String> list = new ArrayList<String>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, yourid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			ps.setInt(1, follow+follower);
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
	public  int followDelete(int follower) throws Exception {
		String sql = "delete from follower_map where follower_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, follower);
			result = ps.executeUpdate();
			
			// rs = ps.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.jdbc_util;
import vo.Book;
import vo.InstaComment;
import vo.InstaPost;

public class instaDao {

	
	public  static JSONArray getAllBookJSON(int i) {
		int result = 0;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Statement st = null;
		String sql = "select img from posts where user_id = ? ";
		JSONArray list = new JSONArray();
		try {
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, i);
			rs = ps.executeQuery();

			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				if(obj!=null)
					list.add(obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbc_util.close(con, ps, rs);
		}
		return list;

	}
	public  static List<String> getAllBook(int i) {
		int result = 0;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select img from posts where user_id = ? order by timestamp";
		List<String> list = new ArrayList<String>();
		try {
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, i);
			rs = ps.executeQuery();

			while (rs.next()) {
					list.add(rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbc_util.close(con, ps, rs);
		}
		return list;

	}
	public  int insertPost(InstaPost insta) throws Exception {
		String sql = "insert into posts(id,content, user_id,img) values((select nvl(max(id),0)+1 from posts),?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setString(1, insta.getContent());
			ps.setInt(2, insta.getUser_id());
			ps.setString(3, insta.getImg());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int updatePost(InstaPost insta) throws Exception {
		String sql = "update posts set content=?  where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setString(1, insta.getContent());
			ps.setInt(2, insta.getId());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int deletePost(InstaPost insta) throws Exception {
		String sql = "delete from posts where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, insta.getId());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  InstaPost selectPost(InstaPost insta) throws Exception {
		String sql = "select u.name, u.img, p.content, p.img, p.timestamp from posts p join users u on p.user_id=u.id where p.id= ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		InstaPost result = null;
		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, insta.getId());
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			if (rs.next()) {
				 result = new InstaPost(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  InstaComment selectComment(InstaComment com) throws Exception {
		String sql = "select u.name, u.img, c.content, c.timestamp from comment c join users u on c.user_id = u.id where post_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		InstaComment result = null;
		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, com.getPost_id());
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			if (rs.next()) {
				 result = new InstaComment(rs.getString(1),rs.getString(2),rs.getString(3),rs.getDate(4));

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int deleteComment(InstaComment com) throws Exception {
		String sql = "delete from comment where post_id=? and user_id = ? and ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, com.getId());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int insertComment(InstaComment com) throws Exception {
		String sql = "insert into comment(id, content, post_id, user_id) values(seq, ?,?,?) ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setString(1, com.getContent());
			ps.setInt(2, com.getPost_id());
			ps.setInt(3, com.getUser_id());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int updateComment(InstaComment com) throws Exception {
		String sql = "update comment set content = ? where id= ? ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setString(1, com.getContent());
			ps.setInt(2, com.getPost_id());
			ps.setInt(3, com.getUser_id());
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
	public  int followinsert(int follow, int follower) throws Exception {
		String sql = "insert into follower_map(id , target_id, follower_id) values(?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = jdbc_util.con2();
			ps = con.prepareStatement(sql);
			ps.setInt(1, follow+follower);
			ps.setInt(2, follow);
			ps.setInt(3, follower);
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();
			if (result == 1) {
				System.out.println(result + "개 추가 완료");

			} else {
				System.out.println("없는 데이터입니다.");

			} // 두가지 조건 핸들링할때는 삼항 연산자도 있다!
		} catch (Exception e) {
			throw e;
		} finally {
			jdbc_util.close(con, ps, null);
		}
		return result;
	}
}

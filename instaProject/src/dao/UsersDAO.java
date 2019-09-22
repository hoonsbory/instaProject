package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import util.JDBCUtil;
import vo.UsersVO;

public class UsersDAO {
	public List<UsersVO> searchAllUsers() { // 모든 유저 정보 검색
		String sql = "select * from users order by email";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UsersVO> list = new ArrayList<UsersVO>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UsersVO vo = new UsersVO();
				vo.setId(rs.getInt("id"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}

	public int loginUser(UsersVO vo) { // 로그인-존재 유무 확인
		String sql = "select * from users where email=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			rs = ps.executeQuery();
			if (rs.next()) {
				if (BCrypt.checkpw(vo.getPassword(), rs.getString("password"))) //암호화된 비번이랑 입력한 비번이랑 비교
					return rs.getInt("id"); //로그인 성공
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return -1; //로그인 실패
	}

	public int insertUser(UsersVO vo) { // 회원가입
		String sql = "insert into users(id,email,password,name) values((select nvl(max(id),0)+1 from users),?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}

	public int deleteUser(int id) { // 회원탈퇴
		String sql = "delete from users where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}

		return result;
	}

	public List<String> searchUserAllImgs(int id) { // 탈퇴 전 이미지 삭제 위한 검색->프사+post사진 경로 리스트
		String sql = "select u.img as uimg, p.img as pimg from users u, posts p where u.id=? and u.id=p.user_id(+)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		String uimg = null;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (uimg == null) // 프사 경로
					uimg = rs.getString("uimg");
				list.add(rs.getString("pimg")); // 삭제 대상에 post사진 경로 추가
			}
			if (!uimg.equals("./userpic/default.jpg")) // 프사가 디폴트 이미지가 아니면
				list.add(uimg); // 삭제 대상에 프사 경로 추가
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}

	public UsersVO searchUser(int id) { // 개인정보 변경할때 입력칸 채워두기 위한 검색, 프사 필요시 검색.. 등등
		String sql = "select * from users where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UsersVO vo = new UsersVO();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				vo.setId(rs.getInt("id"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setImg(rs.getString("img"));
				vo.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return vo;
	}

	public int updateUser(String column, String val, int id) { // 개인정보 변경. 업뎃 불가능할때는 이메일 중복일때
		String sql = "update users set "+ column +" =? where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, val);
			ps.setInt(2, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
}

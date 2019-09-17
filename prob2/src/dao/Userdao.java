package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;
import vo.UserVO;

public class Userdao {
	//Create(insert)
	
	public static void main(String[] args) {
		getUsersRec().forEach(i-> System.out.println(i));
	}
	public int insertUser(UserVO vo) {
		System.out.println("회원등록 완료");
		String sql = "INSERT INTO users(id, password, name) VALUES(?,?,?) ";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);

			//? 세팅
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			
			//실행 및 결과값 핸들링
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	//Update(id 값이 일치할때 password 변경)
	public int updateUser(UserVO vo) {
		String sql = "update users set id =? where password=?";
		System.out.println("update 완료");
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			//? 세팅
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			
			//실행 및 결과값 핸들링
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public int deleteUser(UserVO vo) {
		String sql = "delete from users where id =? and password = ?";
		System.out.println("delete 완료");
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			//? 세팅
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			
			//실행 및 결과값 핸들링
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public int CheckUser(UserVO vo) {
		String sql = "select * from users where id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result  = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			//? 세팅
			ps.setString(1, vo.getId());
			rs = ps.executeQuery();
			//실행 및 결과값 핸들링
			
			while (rs.next()) {
				result =1;
			}
		} catch (Exception e) {
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	//Delete(id값 과 password 값이 일치 할 때 삭제) =>FK,PK 값이기 때문에 삭제 잘 안됨. pass
	
	//회원리스트 출력
	public static List<UserVO> getUsersRec(){
		String sql = "select * from(" +
					 "select rownum row#, id, password, name, role " + 
					 "from (select * from users order by rownum)) ";
				
				
		List <UserVO> list = new ArrayList<UserVO>();
		
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
				UserVO vo = new UserVO();
				vo.setId(rs.getString("id")); //MYbatis 에서는 Bookid와 bookid가 같으면 자동으로 rowmapping을 해준다.
				vo.setPassword((rs.getString("password")));
				vo.setName(rs.getString("name"));
				vo.setRole(rs.getString("role"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
	
	//로그인
	public int login(UserVO vo) {
		
		Connection con = null;
		PreparedStatement ps =null; //? 처리 O 관리 객체
		ResultSet rs = null;
		
		String sql = "select * from users where id = ? and password = ?";
		
		int count = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			
			rs = ps.executeQuery();			
			
			if(rs.next()) {
				count =1;
				
			}else {
				System.out.println("로그인 실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, ps, rs);
		}
		return count;
	}

}

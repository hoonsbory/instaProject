package service;

import java.util.List;

import dao.Userdao;
import vo.UserVO;

public class UserServiceImpl implements UserService{
	Userdao dao;
	
	public UserServiceImpl() {}
	public UserServiceImpl(Userdao dao) {
		this.dao = dao;
	}
	
	public Userdao getDao() {
		return dao;
	}
	public void setDao(Userdao dao) {
		this.dao = dao;
	}
	
	@Override
	public int addUser(UserVO vo) {
		return dao.insertUser(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		return dao.updateUser(vo);
	}

	@Override
	public List<UserVO> UserList() {
		return dao.getUsersRec();
	}

	@Override
	public int login(UserVO vo) {
		return dao.login(vo);
	}
	@Override
	public int checkUser(UserVO vo) {
		
		return dao.CheckUser(vo);
	}

}









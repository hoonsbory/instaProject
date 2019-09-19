package service;

import java.util.List;

import dao.UsersDAO;
import vo.UsersVO;

public class UsersServiceImpl implements UsersService {

	UsersDAO dao;
	
	public UsersServiceImpl() {}
	public UsersServiceImpl(UsersDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<UsersVO> searchAllUsers() {
		// TODO Auto-generated method stub
		return dao.searchAllUsers();
	}

	@Override
	public boolean loginUser(UsersVO vo) {
		// TODO Auto-generated method stub
		return dao.loginUser(vo);
	}
	
	@Override
	public int addUser(UsersVO vo) {
		// TODO Auto-generated method stub
		return dao.insertUser(vo);
	}

	@Override
	public int dropUser(int id) {
		// TODO Auto-generated method stub
		return dao.deleteUser(id);
	}
	@Override
	public List<String> searchUserImg(int id) {
		// TODO Auto-generated method stub
		return dao.searchUserImg(id);
	}

}

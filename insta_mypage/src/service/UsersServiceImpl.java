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
	public int loginUser(UsersVO vo) {
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
	public List<String> searchUserAllImgs(int id) {
		// TODO Auto-generated method stub
		return dao.searchUserAllImgs(id);
	}
	@Override
	public UsersVO searchUser(int id) {
		// TODO Auto-generated method stub
		return dao.searchUser(id);
	}
	@Override
	public int updateUserEmailName(UsersVO vo) {
		// TODO Auto-generated method stub
		return (dao.updateUser("email",vo.getEmail(),vo.getId())*dao.updateUser("name",vo.getName(),vo.getId()));
	}
	@Override
	public int updateUserPassword(UsersVO vo) {
		// TODO Auto-generated method stub
		return dao.updateUser("password",vo.getPassword(),vo.getId());
	}
	@Override
	public int updateUserImg(UsersVO vo) {
		// TODO Auto-generated method stub
		return dao.updateUser("img",vo.getImg(),vo.getId());
	}
	
	

}

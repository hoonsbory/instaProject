package service;

import java.util.List;

import vo.UsersVO;

public interface UsersService {
	List<UsersVO> searchAllUsers();
	boolean loginUser(UsersVO vo);
	int addUser(UsersVO vo);
	int dropUser(int id);
	List<String> searchUserImg(int id);
}

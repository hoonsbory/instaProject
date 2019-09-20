package service;

import java.util.List;

import vo.UsersVO;

public interface UsersService {
	List<UsersVO> searchAllUsers();
	boolean loginUser(UsersVO vo);
	int addUser(UsersVO vo);
	int dropUser(int id);
	List<String> searchUserAllImgs(int id);
	UsersVO searchUserImg(int id);
	UsersVO searchUser(int id);
	int updateUserEmailName(UsersVO vo);
	int updateUserPassword(UsersVO vo);
	int updateUserImg(UsersVO vo);
	
}

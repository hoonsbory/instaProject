package service;

import dao.FollowDAO;

public class FollowServiceImpl implements FollowService{
	FollowDAO dao;
	
	public FollowServiceImpl() {}

	public FollowServiceImpl(FollowDAO dao) {
		this.dao = dao;
	}

	@Override
	public int insertFollow(int follow, int follower) throws Exception {
		return dao.followInsert(follow, follower);
	}

	@Override
	public int deleteFollow(int follower) throws Exception {
		return dao.followDelete(follower);
	}
	
	
}

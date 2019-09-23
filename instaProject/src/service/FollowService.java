package service;


public interface FollowService {
	int insertFollow(int follow, int follower) throws Exception;
	int deleteFollow(int follower) throws Exception;
}


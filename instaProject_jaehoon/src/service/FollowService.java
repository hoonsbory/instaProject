package service;

import java.util.List;

public interface FollowService {
	int insertFollow(int follow, int follower) throws Exception;
	int deleteFollow(int follow , int follower) throws Exception;
	int checkFollow(int follow, int follower) throws Exception;
	List<String> followernum(int yourid) throws Exception;
	List<String> follownum(int myid) throws Exception;
}


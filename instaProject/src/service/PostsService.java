package service;

import java.util.List;

import vo.PostsVO;

public interface PostsService {
	
	List<PostsVO> getAllPostsRec(int user_id);
	int insertPosts(PostsVO vo);
	int deletePosts(int id);
	int updatePosts(PostsVO vo);
}

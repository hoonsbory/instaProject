package service;

import java.util.List;

import org.json.simple.JSONArray;

import vo.PostsVO;

public interface PostsService {
	
	List<PostsVO> getAllPostsRec(int user_id);
	int insertPosts(PostsVO vo);
	int deletePosts(int id);
	int updatePosts(PostsVO vo);
	String showPosts(int id);
	String besidePosts(int id);
}

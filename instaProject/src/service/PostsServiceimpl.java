package service;

import java.util.List;

import org.json.simple.JSONArray;

import dao.PostsDAO;
import vo.PostsVO;

public class PostsServiceimpl implements PostsService{
	PostsDAO dao;
	
	public PostsServiceimpl() {}
	public PostsServiceimpl(PostsDAO dao) {
		this.dao = dao;
	}
	
	public PostsDAO getDao() {
		return dao;
	}
	public void setDao(PostsDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<PostsVO> getAllPostsRec(int user_id) {
		return dao.getAllPostsRec(user_id); 
	}

	@Override
	public int insertPosts(PostsVO vo) {
		return dao.insertPosts(vo);
	}

	@Override
	public int deletePosts(int id) {
		return dao.deletePosts(id);
	}

	@Override
	public int updatePosts(PostsVO vo) {
		return dao.updatePosts(vo);
	}
	@Override
	public String showPosts(int id) {
		return dao.showPosts(id);
	}
	@Override
	public String besidePosts(int id) {
		// TODO Auto-generated method stub
		return dao.besidePosts(id);
	}
	
}

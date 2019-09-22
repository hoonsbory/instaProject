package service;

import org.json.simple.JSONArray;

import dao.InstaDao;
import vo.InstaComment;

public class CommentsServiceImpl implements CommentsService{
	
	InstaDao dao;
	
	public CommentsServiceImpl() {}
	public CommentsServiceImpl(InstaDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public JSONArray selectAllComments(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAllComments(post_id);
	}

	@Override
	public InstaComment selectComment(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectComment(id);
	}

	@Override
	public int deleteComment(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteComment(id);
	}

	@Override
	public int insertComment(InstaComment com) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertComment(com);
	}

	@Override
	public int updateComment(InstaComment com) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateComment(com);
	}

}

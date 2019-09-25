package service;

import dao.LikesDAO;
import vo.LikesVO;

public class LikesServiceimpl implements LikesService{
	LikesDAO dao;

	public LikesServiceimpl() {}

	public LikesServiceimpl(LikesDAO dao) {
		this.dao = dao;
	}
	

	public LikesDAO getDao() {
		return dao;
	}

	public void setDao(LikesDAO dao) {
		this.dao = dao;
	}

	@Override
	public int insertLikes(LikesVO vo) {
		return dao.insertLikes(vo);
	}

	@Override
	public int deleteLikes(int post_id) {
		return dao.deleteLikes(post_id);
	}
	
	
	
}

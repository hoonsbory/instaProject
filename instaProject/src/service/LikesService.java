package service;

import java.util.List;

import vo.LikesVO;

public interface LikesService {
	int insertLikes(LikesVO vo);
	int deleteLikes(int post_id);
}

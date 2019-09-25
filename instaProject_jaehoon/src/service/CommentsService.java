package service;

import org.json.simple.JSONArray;

import vo.CommentsVO;

public interface CommentsService {
	JSONArray selectAllComments(int post_id) throws Exception;
	CommentsVO selectComment(int id) throws Exception;
	int deleteComment(int id) throws Exception;
	int insertComment(CommentsVO com) throws Exception;
	int updateComment(CommentsVO com) throws Exception;
}

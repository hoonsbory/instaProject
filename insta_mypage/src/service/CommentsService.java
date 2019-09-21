package service;

import org.json.simple.JSONArray;

import vo.InstaComment;

public interface CommentsService {
	JSONArray selectAllComments(int post_id) throws Exception;
	InstaComment selectComment(int id) throws Exception;
	int deleteComment(int id) throws Exception;
	int insertComment(InstaComment com) throws Exception;
	int updateComment(InstaComment com) throws Exception;
}

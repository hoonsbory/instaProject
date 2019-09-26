package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.CommentsDAO;
import dao.FollowDAO;
import dao.LikesDAO;
import dao.PostsDAO;
import service.CommentsService;
import service.CommentsServiceImpl;
import service.FollowService;
import service.FollowServiceImpl;
import service.LikesService;
import service.LikesServiceimpl;
import service.PostsService;
import service.PostsServiceimpl;
import vo.LikesVO;

@WebServlet("/showPost.do")
public class ShowPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		PostsDAO dao = new PostsDAO();
		PostsService service = new PostsServiceimpl(dao);
		LikesDAO ldao = new LikesDAO();
		LikesService lservice = new LikesServiceimpl(ldao);
		
		FollowDAO dao2 = new FollowDAO();
		FollowService service2 = new FollowServiceImpl(dao2);
		
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		try {
			Map<String, String> show = service.showPosts(post_id);
			int user_id=Integer.parseInt(show.get("user_id"));
			Map<String, Integer> beside = service.besidePosts(user_id, post_id);
			List<LikesVO> list = new ArrayList<LikesVO>();
			list = lservice.countLikes(post_id);
			int count = list.size();
			int mycount = 0;
			int check=0;
			HttpSession session = request.getSession();
			if (session.getAttribute("login") != null) {
				int login_id = (int) session.getAttribute("id");
				mycount = lservice.checkMyLike(post_id, login_id);
				check = service2.checkFollow(login_id, user_id);
				int follower = service2.followernum(user_id).size();
				int follow = service2.follownum(user_id).size();
				request.setAttribute("follower", follower);
				request.setAttribute("follow", follow);
			}
			request.setAttribute("post", show);
			request.setAttribute("beside", beside);
			request.setAttribute("like", count);
			request.setAttribute("mylike", mycount);
			request.getRequestDispatcher("post.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

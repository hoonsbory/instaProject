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
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		

			PostsDAO dao=new PostsDAO();
			PostsService service=new PostsServiceimpl(dao);
			LikesDAO ldao = new LikesDAO();
			LikesService lservice = new LikesServiceimpl(ldao);
			int post_id=Integer.parseInt(request.getParameter("post_id"));
			try {
				Map<String, String> show =service.showPosts(post_id);
				Map<String, Integer> beside=service.besidePosts(post_id);
				List<LikesVO> list = new ArrayList<LikesVO>();
				list = lservice.countLikes(post_id);
				int count=list.size();
				request.setAttribute("post", show);
				request.setAttribute("like", count);
				request.getRequestDispatcher("post.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}



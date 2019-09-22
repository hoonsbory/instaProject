package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import dao.InstaDao;
import dao.UsersDAO;
import service.CommentsService;
import service.CommentsServiceImpl;
import service.UsersService;
import service.UsersServiceImpl;
import vo.InstaComment;
import vo.UsersVO;

@WebServlet("/showComment.do")
public class ShowCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
			InstaDao dao=new InstaDao();
			CommentsService service=new CommentsServiceImpl(dao);
			int post_id=Integer.parseInt(request.getParameter("post_id"));
			JSONArray array=null;
			try {
				array=service.selectAllComments(post_id);
				PrintWriter out=response.getWriter();
				out.print(array);
				System.out.println(array);
				out.flush();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}

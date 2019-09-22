package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InstaDao;
import service.CommentsService;
import service.CommentsServiceImpl;

@WebServlet("/deleteComment.do")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");  
		
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			InstaDao dao=new InstaDao();
			CommentsService service=new CommentsServiceImpl(dao);
			String data=request.getParameter("id");
			int id=Integer.parseInt(data.substring(data.lastIndexOf('_')+1));
			int result=0;
			try {
				result=service.deleteComment(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result==0) {
				System.out.println("삭제 실패");
			}else {
				PrintWriter out=response.getWriter();
				out.print(id);
				out.flush();
			}
		} else {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}

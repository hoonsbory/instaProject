package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.UsersVO;

@WebServlet({ "/profileEdit.do", "/profile.do" })
public class ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { //db에서 개인정보가져와서 ui로
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
			UsersDAO dao = new UsersDAO();
			UsersService service = new UsersServiceImpl(dao);
			UsersVO vo = new UsersVO();
			vo = service.searchUser(id);
			request.setAttribute("user", vo);
			request.getRequestDispatcher("profileEdit.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException { //개인정보변경
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login"); // login="id/name"
		int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		UsersVO vo = new UsersVO();
		int result=0;
		vo.setEmail(request.getParameter("email"));
		vo.setName(request.getParameter("name"));
		result=service.updateUserEmailName(vo);
		if(result==0)
			request.setAttribute("msg", "이미 가입된 이메일입니다.");
		request.setAttribute("user", vo);
		request.getRequestDispatcher("profileEdit.jsp").forward(request, response);
		
	}

}

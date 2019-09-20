package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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

@WebServlet("/profImgChange.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class ProfImgChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
			UsersDAO dao = new UsersDAO();
			UsersService service = new UsersServiceImpl(dao);
			UsersVO vo = new UsersVO();
			int result = 0;
			String path = request.getRealPath("/userpic/");
			Collection<Part> parts = request.getParts();
			for (Part p : parts) {
				if (p.getContentType() != null) {
					String fileName = p.getSubmittedFileName();
					if (fileName != null && fileName.length() != 0) {
						p.write(path + fileName);
						vo.setId(id);
						vo.setImg("./userpic/" + fileName);
						System.out.println(vo);
						result = service.updateUserImg(vo);
					}
				}
			}
			if (result == 0)
				System.out.println("프사변경실패");
			else
				System.out.println("프사변경성공");

		}
		request.getRequestDispatcher("profileEdit.do").forward(request, response); //가능한가?
	}

}

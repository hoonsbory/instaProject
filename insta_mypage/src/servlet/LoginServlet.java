package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.UsersVO;

 @WebServlet({"/login.do","/logout.do"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			                                      throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		response.sendRedirect("./index.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                                      throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
		
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl();
		UsersVO vo = new UsersVO(); // ?? 
		
		
		
        String email = request.getParameter("email"); // 로그인 폼에 입력되는 아이디 값을 받아온다 
        String password = request.getParameter("password"); // 로그인 폼에 입력되는 비밀번호 값을 받아온다 
        
        System.out.println("/login.do ");
        System.out.println(email+"/"+password);
        
        if(email==null||password==null||email.length()==0||password.length()==0) {
        	//response.sendRedirect("./login.jsp");
        	request.setAttribute("msg", "password 정보를  입력하세요");
        	request.setAttribute("email", email);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        }
        vo.setEmail(email);
        vo.setPassword(password);
        int id = service.loginUser(vo);
        if(id>0) {
        	
        
        	HttpSession session = request.getSession();
        	session.setAttribute("login", id+"/"+service.searchUser(id).getName());
        	
        	request.getRequestDispatcher("profile.do").forward(request, response);
        	
        }else {
        	
        	request.setAttribute("msg", "로그인 실패 ");
        	request.setAttribute("email", email);
        	
        	request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
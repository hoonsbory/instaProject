package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.sun.xml.internal.txw2.Document;

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
		response.sendRedirect("./login.jsp");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                                      throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
		
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		UsersVO vo = new UsersVO();
		
        String email = request.getParameter("email");
        String pw = request.getParameter("pw");
        

        if(email==null||email.length()==0) {
        	request.setAttribute("msg", "");
        	request.setAttribute("email", email);
        	request.getRequestDispatcher("login.jsp").forward(request, response); 
        	return;

        }else {
        	request.setAttribute("email", email);

        } 
        
        if(pw==null||pw.length()==0) {
        	request.setAttribute("msg", "");
        	request.setAttribute("password", pw);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        }
      
        
        vo.setEmail(email);
        vo.setPassword(pw);
 
        int id = service.loginUser(vo);
        if(id>0) {
        	HttpSession session = request.getSession();
        	session.setAttribute("login", id+"/"+service.searchUser(id).getName());
        	request.getRequestDispatcher("mypage.do").forward(request, response);
        	
        }else {
        	request.setAttribute("msg", "이메일 또는 비밀번호를 다시 확인하세요. ");
        	request.setAttribute("email", email);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
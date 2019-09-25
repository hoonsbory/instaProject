package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import dao.InstaDao;
import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.InstaPost;
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
		int count = 0;
		
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
		
        PrintWriter out = response.getWriter();
        
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		UsersVO vo = new UsersVO();
		InstaDao dao2 = new InstaDao();
		InstaPost ins = new InstaPost();
		String email = request.getParameter("email");
        String pw = request.getParameter("pw");
        List<InstaPost> list = new ArrayList<InstaPost>();
        
        if(email==null||pw==null||email.length()==0||pw.length()==0) {
        	request.setAttribute("msg", "password 정보를  입력하세요");
        	request.setAttribute("email", email);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        }
        vo.setEmail(email);
        vo.setPassword(pw);
        int id = service.loginUser(vo);
        UsersVO user = new UsersVO();
        if(id>0) {
        	HttpSession session = request.getSession();
        	session.setAttribute("login", id+"/"+service.searchUser(id).getName());
        	session.setAttribute("id", id);
        	list = dao2.getAllBook(id);
        	int count2 = service.postnum(id); //포스트갯수
        	user = service.profileImg(id); //프로필 부분 db
        	request.setAttribute("list", list);
        	request.setAttribute("img", user.getImg());	//프로필부분 db가져오기
        	request.setAttribute("name", user.getName());
        	request.setAttribute("info", user.getInfo());
        	request.setAttribute("count", count);
        	for (int i = list.size(); i>0; i-=3){
        		out.print("<div class='divmain'>");
        		for(int j = 3; j>0; j--){
        		
        				out.print("<a class='apic'>");
        				out.print("<img class='mainimg' src='"+list.get(count).getImg()+"'>");
        				
        				out.print("</img>");
        				out.print("</a>");
        				count++;
        			
        		}
        		out.print("</div>");
        	}
        	out.flush();
			request.getRequestDispatcher("/mypage.jsp").include(request, response);
        	
			
        }else {
        	request.setAttribute("msg", "로그인 실패 ");
        	request.setAttribute("email", email);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
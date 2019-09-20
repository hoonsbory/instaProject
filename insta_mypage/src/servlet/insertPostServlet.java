package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.instaDao;
import vo.InstaPost;

@WebServlet("/insertPost.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class insertPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");  
		
		
		instaDao dao = new instaDao();
		InstaPost post= new InstaPost();
		
		post.setContent(request.getParameter("content"));
		post.setUser_id(Integer.parseInt(request.getParameter("id")));

		String path = request.getRealPath("/upload/");
		
		Collection<Part> parts = request.getParts();
		
		for(Part p : parts) {
			if(p.getContentType()!=null) {
			String filename = p.getSubmittedFileName();
			if(filename !=null && filename.length() != 0) {
				p.write(path+filename);
				post.setImg("./upload/"+filename);
			}
			}
		}
		try {
			dao.insertPost(post);
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			request.setAttribute("exception", e);
			getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
			//에러가 발생하면 error라는 페이지로 포워딩을하는데, 서블릿에서 addbook함수를 실행할때 이미 함수에 catch문으로 
			//에러를 다 잡았기 때문에 넘어가지않는다. addbook에서 throw로 넘겨줘야 이 서블릿에서 에러가 발생해서 catch문으로 넘어감.
		}
		
		
		
		
		
		
			
	}

}

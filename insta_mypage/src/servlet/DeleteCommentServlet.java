package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CommentsDAO;
import service.CommentsService;
import service.CommentsServiceImpl;

@WebServlet("/deleteComment.do")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");  
		
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			CommentsDAO dao=new CommentsDAO();
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
			}
			int post_id=Integer.parseInt(request.getParameter("post_id"));
			JSONArray array=null;
			try {
				array=service.selectAllComments(post_id);
				out.print(array);
				out.flush();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			Map<String,String> map=new HashMap<String,String>();
			map.put("msg","로그인이 필요한 서비스입니다.");
			JSONObject obj=new JSONObject(map);
			out.print(obj);
			out.flush();
		}
	}

}

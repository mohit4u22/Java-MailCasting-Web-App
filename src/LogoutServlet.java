import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 335690310420914722L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session=request.getSession(false);
		session.invalidate();
		request.setAttribute("logout","You have been sucessfully logged out");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.include(request,response);
	}

}

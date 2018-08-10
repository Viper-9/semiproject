package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.exception.UserException;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet("/info")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public InfoServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		
		RequestDispatcher view = null;
		try {
			User user = new UserService().selectUser(userId);
			if(user != null){
				view = request.getRequestDispatcher("views/user/mypage.jsp"); // info 페이지
				request.setAttribute("user", user);
				view.forward(request, response);
			} else {
				view = request.getRequestDispatcher(""); // 에러페이지
				request.setAttribute("message", userId + "에 대한 조회 실패");
				view.forward(request, response);
			}
		} catch(UserException e){
			view = request.getRequestDispatcher(""); //에러페이지
			request.setAttribute("message", e.getMessage());
			view.forward(request, response);
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

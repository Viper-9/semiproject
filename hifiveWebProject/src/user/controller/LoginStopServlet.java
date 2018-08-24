package user.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class LoginStopServlet
 */
@WebServlet("/loginStop")
public class LoginStopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginStopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String val = request.getParameter("val");
		String userid = request.getParameter("userid");
		
		try{
			if(val.equals("stop")) {
				System.out.println(userid);
				if(new UserService().updateLogin(userid, "Y") > 0) 
					response.sendRedirect("/hifive/ulist");
				else
					System.out.println("로그인 제한 실패");
			} else {
				if(new UserService().updateLogin(userid, "N") > 0)
					response.sendRedirect("/hifive/ulist");
				else
					System.out.println("로그인 허용 실패");
			}

		}catch(Exception e){

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

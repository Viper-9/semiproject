package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.exception.UserException;
import user.model.service.UserService;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchid")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SearchIdServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String userEmail = request.getParameter("searchuseremail");
		System.out.println(userEmail);
		
		//PrintWriter out = response.getWriter();
		RequestDispatcher view = null;
		
		
		try {			
			String userId = new UserService().searchId(userEmail);
			if(userId.length() != 0) {
				System.out.println("사용자의 아이디 = " + userId);
				//request.setAttribute("userId", userId);
				response.setContentType("text/html; charset=utf-8");
				response.sendRedirect("/hifive/main.jsp");
				return;
				//out.print("이메일로 아이디를 발송하였습니다");
				
			} else{
				/*RequestDispatcher errorPage = request.getRequestDispatcher("");
				request.setAttribute("message", "아이디 찾기 실패");
				errorPage.forward(request, response);*/
			}
			
			//out.close();
			
		} catch(UserException e){
			e.printStackTrace();
			/*RequestDispatcher errorPage = request.getRequestDispatcher("");
			request.setAttribute("message", e.getMessage());
			errorPage.forward(request, response);*/
		}
	}

}

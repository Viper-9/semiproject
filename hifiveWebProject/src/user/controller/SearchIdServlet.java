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
		String userEmail = request.getParameter("searchuseremail");
		String userPhone = request.getParameter("userphone");
		
		RequestDispatcher view = null;
		
		try {			
			String userId = new UserService().searchId(userEmail, userPhone);
			if(userId.length() != 0) {
				request.setAttribute("userId", userId);
				
			} else{
				RequestDispatcher errorPage = request.getRequestDispatcher("");
				request.setAttribute("message", "아이디 찾기 실패");
				errorPage.forward(request, response);
			}
			
		} catch(UserException e){
			RequestDispatcher errorPage = request.getRequestDispatcher("");
			request.setAttribute("message", e.getMessage());
			errorPage.forward(request, response);
		}
	}

}

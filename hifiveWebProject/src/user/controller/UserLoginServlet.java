package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.exception.UserException;
import user.model.service.UserService;


@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
    public UserLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String userId = request.getParameter("userid");
		String userPw = request.getParameter("userpw");
				
		
		
		  try {
			  
			String userName = new UserService().loginCheck(userId, userPw);
			
			String returnValue = "0";
			PrintWriter out = response.getWriter();
			
			if(userName != null){
				HttpSession session = request.getSession();
				// session.setMaxInactiveInterval(10*60); // 자동 로그아웃...
				session.setAttribute("userName", userName);
				session.setAttribute("userId", userId);
				returnValue = "1";
				out.flush();
				
			} else {
				returnValue = "0";
				out.flush();
			}
				
				
			
			
			response.setContentType("text/html; charset=utf-8");
			
			out.append(returnValue);	
			out.close();
			return;
			
			
			
		} catch(UserException e){
			e.printStackTrace();
		}
	}
    
    
    
    /*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		String userPw = request.getParameter("userpassword");
		
		
		
		
		  try {
			String userName = new UserService().loginCheck(userId, userPw);
		
			if(userName != null){
				HttpSession session = request.getSession();
				// session.setMaxInactiveInterval(10*60); // 자동 로그아웃...
				session.setAttribute("userName", userName);
				session.setAttribute("userId", userId);
				
				response.sendRedirect("/hifive/main.jsp"); 
				// 로그인 페이지 닫고, 인덱스 페이지 -> 메인 페이지로 넘기고 싶은데 방법을 모르겠어요 ㅠㅠ
			} else{
				RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
				request.setAttribute("message", "아이디나 비밀번호를 다시 확인하세요");
				view.forward(request, response);	
			}			
		} catch(UserException e){
			RequestDispatcher errorPage = request.getRequestDispatcher("에러페이지주소");
			request.setAttribute("message", e.getMessage());
			errorPage.forward(request, response);
		}
	}*/
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

}

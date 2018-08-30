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
import user.model.vo.User;


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
		PrintWriter out = response.getWriter();
				
		
		
		  try {
			  
			String returnValue = "0";	
			User user = new UserService().selectUser(userId);					
			String userName = new UserService().loginCheck(userId, userPw);	
			String blockcheck = "T";
			if(user != null){
			blockcheck = user.getRestriction();
			}
			
			HttpSession session = request.getSession();
					
			if(userId.equals("admin")){
				session.setAttribute("userName", userName);
				session.setAttribute("userId", userId);
				session.setAttribute("loginuser", user);
				returnValue = "2";
				out.flush();
			}else if(userName != null && user != null && blockcheck.equals("N")){
				session.setAttribute("userName", userName);
				session.setAttribute("userId", userId);
				session.setAttribute("loginuser", user);				
				returnValue = "1";
				out.flush();
			} else if(userName != null && user != null && blockcheck.equals("Y")){
				returnValue = "3";
				out.flush();
			} else {
				returnValue = "0";
				out.flush();
			}
					
			response.setContentType("text/html; charset=utf-8");
			
			out.append(returnValue);	
			out.close();
		
			
			
			
		} catch(UserException e){
			e.printStackTrace();
			out.println("<script>");
			out.println("alert('관리자에게 문의하세요');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
    
    
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

}

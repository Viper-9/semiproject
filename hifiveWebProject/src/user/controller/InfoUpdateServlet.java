package user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import user.exception.UserException;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class InfoUpdateServlet
 */
@WebServlet("/infoupdate")
public class InfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public InfoUpdateServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher view = null;
		
		int maxSize = 1024 * 1024 * 10; //10Mbyte
		if(!ServletFileUpload.isMultipartContent(request)){
			view = request.getRequestDispatcher("views/user/userError.jsp");
			request.setAttribute("message", "enctype 속성 값 에러");
			view.forward(request, response);
		}
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image");
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());	
		
		User user = new User();
		user.setUser_Id(request.getParameter("userid"));		
		user.setAddress(request.getParameter("address"));
		user.setJob(request.getParameter("job"));		
		user.setPhone(request.getParameter("phone"));
		user.setHobby(String.join(",", request.getParameterValues("hobby")));
		System.out.println("hobby :"+String.join(",", request.getParameterValues("hobby")));
		user.setContent(request.getParameter("introduction"));		
		user.setProfile_image(mrequest.getFilesystemName("profileimg"));
		
	    try {	      	
	    	if(new UserService().updateUser(user) > 0){
	    		response.sendRedirect("/hifive/index.jsp");	    		
	    	}else{
	    		view = request.getRequestDispatcher("views/user/userError.jsp");
		        request.setAttribute("message", "수정 실패");
		        view.forward(request, response);
	    	}    	
	    } catch (UserException e) {
	        view = request.getRequestDispatcher("views/user/userError.jsp");
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

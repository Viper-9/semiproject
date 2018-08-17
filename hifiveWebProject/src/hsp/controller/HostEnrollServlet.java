package hsp.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hsp.model.vo.Host;

/**
 * Servlet implementation class HostEnrollServlet
 */
@WebServlet("/hostenroll")
public class HostEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = (String) request.getSession().getAttribute("userId");
		int user_num = Integer.parseInt(request.getParameter("pnumber"));
		
		String gender = "";
		if(request.getParameter("preferredgender").equals("male"))
			gender = "M";
		else if(request.getParameter("preferredgender").equals("female"))
			gender = "F";
		else
			gender = "A";
		
		String check1 = String.join(",", request.getParameterValues("possible"));
		String check2 = request.getParameter("sleeping");
		String content = request.getParameter("hostetc");
		
		// ~~~~수정중~~~~
		

		
	}

}

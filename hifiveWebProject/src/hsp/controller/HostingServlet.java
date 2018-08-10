package hsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hsp.exception.HostException;
import hsp.model.service.HostService;
import hsp.model.vo.Host;

/**
 * Servlet implementation class HostingServlet
 */
@WebServlet("/hosting")
public class HostingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		
		RequestDispatcher view = null;
		try {
			Host host = new HostService().selectHost(userId);
			System.out.println(host.toString());
			
			if(host != null){
				view = request.getRequestDispatcher("views/user/mypage.jsp");
				request.setAttribute("host", host);
				view.forward(request, response);
			} else {
				view = request.getRequestDispatcher("views/host/hostError.jsp");
				request.setAttribute("message", userId + "호스트 내역 조회 실패");
				view.forward(request, response);
			}		
		} catch (HostException e) {
			view = request.getRequestDispatcher("views/host/hostError.jsp");
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

package hsp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hsp.exception.SurferPartnerException;
import hsp.model.service.SurferPartnerService;
import hsp.model.vo.SurferPartner;

/**
 * Servlet implementation class PartnerSearchServlet
 */
@WebServlet("/partnersearch")
public class PartnerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartnerSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		SurferPartner sp = new SurferPartner();
		sp.setCity(request.getParameter("destination"));
		sp.setUser_num(Integer.parseInt(request.getParameter("num")));
		sp.setStart_date(java.sql.Date.valueOf(request.getParameter("startdate")));
		sp.setEnd_date(java.sql.Date.valueOf(request.getParameter("enddate")));
		System.out.println("검색 : "+sp.toString());
		
		RequestDispatcher view = null;
		ArrayList<Object[]> list;
		try {
			list = new SurferPartnerService().searchPartner(sp);			
			System.out.println("파트너 검색 결과 : "+Arrays.toString(list.toArray()));
			
			if(sp != null){
				view = request.getRequestDispatcher("/hifive/views/hsp/searchPage.jsp");
				request.setAttribute("list", list);
				view.forward(request, response);
			}else{
				view = request.getRequestDispatcher("");
				request.setAttribute("message", "파트너 검색 실패");
				view.forward(request, response);
			}
		} catch (Exception e) {
			view = request.getRequestDispatcher("");
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

package report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import report.exception.ReportException;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportUpdateServlet
 */
@WebServlet("/reportupdate")
public class ReportUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view =null;
	
		Report report = new Report();
		report.setTitle(request.getParameter("rtitle"));
		// 엔터값 처리
		String content = request.getParameter("rcontent");
		content = content.replace("\r\n", "<br>");
		report.setContent(content);
		report.setReport_no(Integer.parseInt(request.getParameter("reportno")));
		
		try{
			if(new ReportService().updateReport(report) > 0){
				response.sendRedirect("/hifive/reportlist");
			}else{
				view = request.getRequestDispatcher("views/support/report/reportError.jsp");
				request.setAttribute("message", "신고글 수정 실패");
				view.forward(request, response);
			}

		} catch (ReportException e){

			view = request.getRequestDispatcher("views/support/report/reportError.jsp");
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

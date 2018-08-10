package report.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/reportlist")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 페이지별 조회 처리용 컨트롤러
				//내보내는 값에 한글이 포함되어 있을 경우
				response.setContentType("text/html; charset=utf-8");
				
				ReportService rservice = new ReportService();
				
				RequestDispatcher view = null;

				try {
					//해당 페이지에 보이게할 목록 조회
					ArrayList<Report> reportList = rservice.selectAllReport();

			
				
					if(reportList.size() > 0){
						view = request.getRequestDispatcher(
								"views/support/report/reportList.jsp");
						request.setAttribute("reportList", reportList);
						
						view.forward(request, response);
						
					}else{
						view = request.getRequestDispatcher(
								"views/support/report/reportList.jsp");
						request.setAttribute("message", "게시글이 없습니다.");
						view.forward(request, response);
					}		
				
				} catch (ReportException e) {
					System.out.println("실패");
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

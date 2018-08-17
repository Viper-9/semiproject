package hsp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hsp.model.service.SurferPartnerService;
import hsp.model.vo.SurferPartner;

/**
 * Servlet implementation class PartneringServlet
 */
@WebServlet("/partnering")
public class PartneringServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartneringServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		
		try {
			SurferPartner sp = new SurferPartnerService().selectPartner(userId);
			
			JSONObject job = new JSONObject();
			job.put("destination", sp.getCity());
			job.put("startdate", sp.getStart_date().toString());
			job.put("enddate", sp.getEnd_date().toString());
			job.put("num", sp.getUser_num());

			System.out.println(job.toJSONString());
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.append(job.toJSONString());
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
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

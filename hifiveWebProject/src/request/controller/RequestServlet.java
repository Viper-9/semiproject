package request.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hsp.model.service.SurferPartnerService;
import request.exception.RequestException;
import request.model.service.RequestService;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/request")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginid = request.getParameter("loginid");		
		String profileid = request.getParameter("profileid");	
		String profileroll = request.getParameter("profileroll");	
		
		JSONObject job = new JSONObject();
		String loginroll = "";
		
		try {
			if(profileroll.toUpperCase().equals("H")) {
				if(new SurferPartnerService().selectSurfer(loginid) != null) {
					loginroll = "S";
					if(new RequestService().insertRequest(loginid, loginroll, profileid) > 0) {
						job.put("message", "성공");
					}
				} else {
					job.put("message", "서퍼를 등록하지 않았습니다.");
				}
			}
			
		} catch (RequestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.append(job.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

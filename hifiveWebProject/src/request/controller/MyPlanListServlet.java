package request.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.org.glassfish.external.statistics.impl.StatsImpl;

import hsp.model.service.HostService;
import hsp.model.service.SurferPartnerService;
import hsp.model.vo.Host;
import hsp.model.vo.SurferPartner;
import request.model.service.MatchingService;
import request.model.vo.Matching;

/**
 * Servlet implementation class MyPlanListServlet
 */
@WebServlet("/myplan")
public class MyPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPlanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매칭 목록
		String userid = request.getParameter("userid");
	
		Matching m_host = new MatchingService().hostMatching(userid);
		Matching m_surfer = new MatchingService().surferMatching(userid);		
		Matching m_partner = new MatchingService().partnerMatching(userid);

		// 전송될 json 객체 선언 : 객체 하나만 내보낼 수 있음
	    JSONObject json = new JSONObject();
	    
	    // 내가 호스트일때, 서퍼 정보 받아서 출력
	    JSONObject job1 = new JSONObject();
	    if(m_host != null) {
		    SurferPartner surfer = new SurferPartnerService().selectSurfer(m_host.getUser2());	    	
	    	job1.put("matching_date", m_host.getMatching_Date().toString());
	    	job1.put("user_id", surfer.getUser_id());
	    	job1.put("start_date", surfer.getStart_date().toString());
	    	job1.put("end_date", surfer.getEnd_date().toString());
	    	job1.put("user_num", surfer.getUser_num());
	    	job1.put("city", surfer.getCity());
	    	job1.put("role", surfer.getRole());
	    }
	    
	    
    	// 내가 호스트일때, 서퍼 정보 받아서 출력
	    JSONObject job2 = new JSONObject();
	    if(m_surfer != null) {
		    Host host = new HostService().selectHost(m_surfer.getUser1());	    	
	    	job2.put("matching_date", m_surfer.getMatching_Date().toString());
	    	job2.put("user_id", host.getUser_id());
	    	job2.put("user_num", host.getUser_num());
	    	job2.put("p_gender", host.getP_gender());
	    	job2.put("check1", host.getCheck1());
	    	job2.put("check2", host.getCheck2());
	    	job2.put("content", host.getContent());
	    	job2.put("process", host.getProcess());
	    	job2.put("start_date", host.getStart_date().toString());
	    	job2.put("end_date", host.getEnd_date().toString());
	    	job2.put("image1", host.getImage1());
	    	job2.put("image2", host.getImage2());
	    	job2.put("image3", host.getImage3());
	    }
    	
    	JSONObject job3 = new JSONObject();
    	if(m_partner != null) {
	    	SurferPartner partner = null;    	
	    	if(userid.equals(m_partner.getUser1())){
	    		partner = new SurferPartnerService().selectPartner(m_partner.getUser2());
	    	} else{
	    		partner = new SurferPartnerService().selectPartner(m_partner.getUser1());
	    	}
	    	job3.put("matching_date", m_partner.getMatching_Date().toString());
	    	job3.put("user_id", partner.getUser_id());
	    	job3.put("start_date", partner.getStart_date().toString());
	    	job3.put("end_date", partner.getEnd_date().toString());
	    	job3.put("user_num", partner.getUser_num());
	    	job3.put("city", partner.getCity());
	    	job3.put("role", partner.getRole());
    	}
    	json.put("host", job1);
    	json.put("surfer", job2);
    	json.put("partner", job3);	    

	    response.setContentType("application/json; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.print(json.toJSONString());
	    out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

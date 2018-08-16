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
		String userid = request.getParameter("uid");

		ArrayList<Matching> list1 = new MatchingService().hostMatching(userid);
		ArrayList<Matching> list2 = new MatchingService().surferMatching(userid);		
		//ArrayList<Matching> list3 = new MatchingService().partnerMatching(userid);
		
		// 전송될 json 객체 선언 : 객체 하나만 내보낼 수 있음
	    JSONObject json = new JSONObject();
	    
	    // list는 json 배열에 저장하고, json 배열을 전송용 json 객체에 저장함
	    JSONArray jarr_1 = new JSONArray();      
	    JSONArray jarr_2 = new JSONArray();	    
	    //JSONArray jarr_3 = new JSONArray(); 
	    
	    // 내가 호스트일때, 서퍼 정보 받아서 출력
	    for(Matching m : list1){ 
	    	JSONObject job = new JSONObject();
	    	SurferPartner surfer = new SurferPartnerService().selectSurfer(m.getUser2());	    	
	    	job.put("matching_date", m.getMatching_Date().toString());
	    	job.put("user_id", surfer.getUser_id());
	    	job.put("start_date", surfer.getStart_date().toString());
	    	job.put("end_date", surfer.getEnd_date().toString());
	    	job.put("user_num", surfer.getUser_num());
	    	job.put("city", surfer.getCity());
	    	job.put("role", surfer.getRole());

	    	jarr_1.add(job);	    	
	    }
	    
	    // 내가 서퍼일때, 호스트 정보 받아서 출력
	    for(Matching m : list2){
	    	JSONObject job = new JSONObject();
	    	Host host = new HostService().selectHost(m.getUser1());	    	
	    	job.put("matching_date", m.getMatching_Date().toString());
	    	job.put("user_id", host.getUser_id());
	    	job.put("user_num", host.getUser_num());
	    	job.put("p_gender", host.getP_gender());
	    	job.put("check1", host.getCheck1());
	    	job.put("check2", host.getCheck2());
	    	job.put("content", host.getContent());
	    	job.put("process", host.getProcess());
	    	job.put("start_date", host.getStart_date().toString());
	    	job.put("end_date", host.getEnd_date().toString());
	    	job.put("image1", host.getImage1());
	    	job.put("image2", host.getImage2());
	    	job.put("image3", host.getImage3());

	    	jarr_2.add(job);	    	
	    }
	    
	    /*for(Matching m : list3){
	    	JSONObject job = new JSONObject();
	    	jarr_3.add(job);	    	
	    }*/
	    
	    json.put("host_list", jarr_1);
	    json.put("surfer_list", jarr_2);
	    //json.put("partner_list", jarr_3);

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

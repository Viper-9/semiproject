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

import request.model.service.RequestService;
import request.model.vo.Request;

/**
 * Servlet implementation class RequestListServlet
 */
@WebServlet("/requestlist")
public class RequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// main에 출력 시킬 리스트 목록
		String userId = request.getParameter("uid");
		System.out.println("userId : " + userId);
		
		ArrayList<Request> p_list_1 = new RequestService().myPartnerList1(userId);
		ArrayList<Request> p_list_2 = new RequestService().myPartnerList2(userId);
		
		// 전송될 json 객체 선언 : 객체 하나만 내보낼 수 있음
		JSONObject json = new JSONObject();
		// list는 json 배열에 저장하고, json 배열을 전송용 json 객체에 저장함
		JSONArray jarr = new JSONArray();		
		JSONArray jarr2 = new JSONArray();
		
		for(Request r : p_list_1){
			JSONObject job = new JSONObject();
			job.put("r_user_id", r.getR_user_id()); // 상대방 아이디
			job.put("request_date", r.getRequest_date().toString()); // 요청 날짜
			
			jarr.add(job);	
		}
					
		for(Request r : p_list_2){
			JSONObject job = new JSONObject();
			job.put("user_id", r.getUser_id()); // 상대방 아이디
			job.put("request_date", r.getRequest_date().toString()); // 요청 날짜
			
			jarr2.add(job);	
		}
		
		json.put("list1", jarr);
		json.put("list2", jarr2);			

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		
	}

}
package message.controller;

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

import message.model.service.MessageListService;
import message.model.vo.MessageList;

/**
 * Servlet implementation class MessageListServlet
 */
@WebServlet("/mlist")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("uid");
		ArrayList<MessageList> mList1 = new MessageListService().selectMyList1(user_id);
		ArrayList<MessageList> mList2 = new MessageListService().selectMyList2(user_id);
		
		// 전송될 json 객체 선언 : 객체 하나만 내보낼 수 있음
		JSONObject json = new JSONObject();
		// list는 json 배열에 저장하고, json 배열을 전송용 json 객체에 저장함
		JSONArray jarr = new JSONArray();
				
		for(MessageList list : mList1){
			JSONObject job = new JSONObject();
			job.put("list_no", list.getList_no());
			job.put("user1", list.getUser1());
			job.put("user2", list.getUser2());
		
			jarr.add(job);					
		}
		for(MessageList list : mList2){
			JSONObject job = new JSONObject();
			job.put("list_no", list.getList_no());
			job.put("user1", list.getUser1());
			job.put("user2", list.getUser2());
		
			jarr.add(job);
		}

		// json 배열을 전송용 json 객체에 저장함
		json.put("list", jarr);
						
		// json 내보내기
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

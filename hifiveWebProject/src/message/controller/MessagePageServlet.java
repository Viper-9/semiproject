package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.exception.MessageException;
import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class MessagePageServlet
 */
@WebServlet("/mpage")
public class MessagePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int list_no = Integer.parseInt(request.getParameter("listno")); // 대화번호받음..
		String user_id = request.getParameter("uid"); // 내 아이디 받음...
		String user_id2 = request.getParameter("uid2"); // 상대방 아이디
		
		RequestDispatcher view = null;
		try{
			//MessageList mList = new MessageListService().selectOne(list_no);
			ArrayList<Message> myMessage = new MessageService().selectMyMessage(list_no);
			if(myMessage.size() != 0){
				view = request.getRequestDispatcher("views/message/messagePage.jsp");
				request.setAttribute("mList", myMessage);
				request.setAttribute("user_id", user_id);
				view.forward(request, response);
			} else{
				view = request.getRequestDispatcher("views/message/messageError.jsp");
				request.setAttribute("message", "대화창 불러오기 실패");
				view.forward(request, response);
			}
		} catch(MessageException e){
			view = request.getRequestDispatcher("views/message/messageError.jsp");
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

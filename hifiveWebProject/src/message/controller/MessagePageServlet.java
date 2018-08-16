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

		RequestDispatcher view = null;

		ArrayList<Message> myMessage = new MessageService().selectMyMessage(list_no);
		
		view = request.getRequestDispatcher("views/message/messagePage.jsp");
		request.setAttribute("mList", myMessage);
		request.setAttribute("user_id", user_id);
		request.setAttribute("list_no", list_no);
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

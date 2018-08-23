package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.exception.UserException;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/searchpwd")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public SearchPwdServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Properties props = System.getProperties();
		 props.put("mail.smtp.user", "trevelsfriend@gmail.com");
		 props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.port", "465");
		 props.put("mail.smtp.starttls.enable", "true");
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.socketFactory.port", "465");
		 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 props.put("mail.smtp.socketFactory.fallback", "false");
		 
		 Authenticator auth = new MyAuthentication1();
		 
		 //session 생성 및 MimeMessage생성
		 
		 Session session = Session.getDefaultInstance(props, auth);
		 MimeMessage msg = new MimeMessage(session);
		 
		 //이메일 수신자
		 String userEmail = request.getParameter("spwemail");
		 String userId = request.getParameter("spwid");
		 
		 System.out.println("사용자가 입력한 이메일 및 아이디 = " + userEmail + ", " + userId);
		 
		 try {			 
			
			
			String userPw = new UserService().searchPw(userId, userEmail); 
			System.out.println("가져온 비밀번호 값 = " + userPw);
			
			//가져온 비밀번호를 임시 비밀번호 변경
			String pw = "";
			if(userPw != null){
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
				}
			User user = new User();
			user.setUser_Id(userId);
			user.setUser_Pw(pw);
			
			pw = new UserService().updatePass(user);
			System.out.println(pw + "임시비밀번호 db변경성공");
			}
			
			String returnValue = "0";
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if(userId != null && userEmail != null && userPw != null){
				//편지 보낸 시간
				msg.setSentDate(new Date());
				InternetAddress from = new InternetAddress("trevelsfriend@gmail.com");
				
				//이메일 발신자
				msg.setFrom(from);
				
				
				
				//사용자가 입력한 이멜 주소 받아오기
				InternetAddress to = new InternetAddress(userEmail);
				msg.setRecipient(Message.RecipientType.TO, to);
								
				
				//이메일 제목
				msg.setSubject("Travel's couch 고객센터 입니다. ","UTF-8");
				
				
				
				//이메일 내용
				msg.setText("문의하신" + userId + "의 임시비밀번호는 =" + pw + "입니다", "UTF-8");
				
				//이메일 헤더
				msg.setHeader("content-Type", "text/html");
				javax.mail.Transport.send(msg);
				System.out.println("이메일 보내기를 성공");
				
				
				
				returnValue = "1";
				out.append(returnValue);
				out.flush();
				
			} else {
				out.append(returnValue);
				out.flush();
			}
			
			out.close();
			
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e2) {
			e2.printStackTrace();
		} catch (UserException e3) {
			e3.printStackTrace();
		} 
		 
	
		 
	}
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}

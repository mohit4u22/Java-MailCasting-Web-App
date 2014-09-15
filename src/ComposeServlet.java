import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
@WebServlet("/ComposeServlet")
public class ComposeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {


		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);
		
		
		String sender=(String)session.getAttribute("username");
		
		String subject = request.getParameter("subject_id");
		String reciever=request.getParameter("reciever_id");
		String msg=request.getParameter("message");
		
		
		
		final String username = (String)session.getAttribute("email_id");    
		final String password = (String)session.getAttribute("password");  	 
		
 
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session1 = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
		int flag=0;
		
		if(reciever!="" && msg!=""){
		try {
 
			Message message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(username));   
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(reciever)); 
			message.setSubject(subject);
			message.setText(msg);
 
			Transport.send(message);
			flag=SendMessage.sendMsg(username,reciever,subject,msg);
		
 
		} catch (MessagingException e) {
			RequestDispatcher rd=request.getRequestDispatcher("compose.jsp");
			request.setAttribute("status", "Invalid email address");
			rd.include(request, response);
		}
		
		
		}
		if(flag>0){
			
	            
			RequestDispatcher rd=request.getRequestDispatcher("compose.jsp");
			request.setAttribute("status", "Messgae Sent successfully");
			rd.include(request, response);
			
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("compose.jsp");
			if(flag==0)
			{
				request.setAttribute("status","Receiver address and message cannot be null");
			}
			else
			{
				request.setAttribute("status","Sorry,Message was not sent");
			}
			
			rd.include(request, response);
		}
		
	}

}

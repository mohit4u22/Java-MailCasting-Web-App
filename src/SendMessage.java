import java.sql.*;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
public class SendMessage {
static int status=0;
static int id=1;
public static int sendMsg(String sender,String reciever,String subject,String msg ){
	
	PreparedStatement ps=null;
	Connection con=null;
	Statement st=null;
	
	try {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mail","root","root");

		java.util.Date sqdate=Calendar.getInstance().getTime();
		java.sql.Date dat =new java.sql.Date(sqdate.getTime());
		ps=con.prepareStatement("Insert into outbox values(?,?,?,?,?,?)");
		ps.setString(3,sender);
		ps.setString(2,reciever);
		ps.setString(4,msg);
		ps.setString(6, subject);
		String maxquery="select max(id) from outbox";
		ResultSet rs=ps.executeQuery(maxquery);
		int max=0;
		while(rs.next())
		{
		max=rs.getInt(id);
		
		}
		max++;
		ps.setDate(5,dat);
		ps.setInt(1,max);
		
		
		

		status=ps.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}

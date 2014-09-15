import java.sql.*;
public class RegisterUser {
static int status=0;
public static int register(String email,String password,String name,String gender,String mname, String country) {
	
	
	Statement ps=null;
	Connection con=null;
	
	try {
		try{
		Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mail","root","root");
		ps=con.createStatement();
		String sql="Insert into user values('"+email+"','"+password+"','"+name+"','"+gender+"','"+mname+"','"+country+"')";
		
		ps = (Statement) con.createStatement();
	
						
		ps.executeUpdate(sql);
		System.out.println("Register User--------------->>>>>>>>" + email + password + name + gender + mname + country);
		status++;
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return status;
	
}
}

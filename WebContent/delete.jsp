<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>


<%
	String n = request.getParameter("val");
	System.out.println("value of n :---------------------->" + n);
	if (n.length() > 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/mail", "root", "root");

			Statement ps = con.createStatement();
			String sql = "delete from outbox where id='" + n + "'";

			out.print("<br>");
			ps.executeUpdate(sql);
			out.print("Mail has been successfully deleted");

			out.print("Mail has been successfully deleted");

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end of if
%>
<jsp:forward page="inbox.jsp"></jsp:forward>
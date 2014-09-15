<jsp:include page="header.jsp"></jsp:include>
<%@page import="java.sql.*"%>


<head>
<link href="mycss1.css" rel="stylesheet" type="text/css">

</head>
<div id="parallax" style="top: 50px;"></div>

<br>
<br>
<br>
<br>
<br>
<br>


<div class="4u">

	<%
		if (session.getAttribute("username") != null) {
			String username = (String) session.getAttribute("username");
			out.print("<p class='loginname'>Welcome " + username
					+ "</font>");
			if (request.getAttribute("delete") != null) {
				String delete = (String) session.getAttribute("username");
				out.print("<p class='compose'>" + delete + "</font>");
			}
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3307/mail", "root", "root");
				PreparedStatement ps = con
						.prepareStatement("Select * from outbox where SENDER=?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				out.print("<div id='bottom'></div>");

				out.print("<table border='1' class='table1' >");
				out.print("<tr><th>Reciever</th><th>Subject</th><th>Message</th><th>Date</th><th>Delete</th></tr>");

				while (rs.next()) {

					int id = rs.getInt(1);

					System.out.print(id);

					out.print("<tr>");

					out.print("<td>" + rs.getString(2) + "</td>");
					out.print("<td>" + rs.getString(6) + "</td>");
					out.print("<td>" + rs.getString(4) + "</td>");
					out.print("<td>" + rs.getString(5) + "</td>");

					out.print("<td><a href='delete.jsp?val=" + id
							+ "'> Delete</a></td>");

					out.print("</tr>");

				}
				out.print("</table>");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		else {
			request.setAttribute("Error1", "Please Do Login First");
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>





</div>






<footer>
	<div class="social">
		<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
	</div>
	<p>Illinois State Universty 2014</p>

	<br class="clearfix" />
</footer>

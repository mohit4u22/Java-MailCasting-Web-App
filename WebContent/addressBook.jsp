<jsp:include page="header.jsp"></jsp:include>

<div id="parallax" style="top: 50px;"></div>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<title>Address Book</title>
</head>
<body>
	<%
		if (session.getAttribute("username") != null) {
			String username = (String) session.getAttribute("username");
			out.print("<p class='username'>Welcome " + username + "</p>");
		} else {
			request.setAttribute("Error1", "Please Do Login First");
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
	<%
		String username = (String) session.getAttribute("username");
	%>




	<form action="viewFriend.jsp" method="post" id="form1">
		<br> <br> <br> <br> <a href="cart.jsp"
			class="ahref">Add Friend</a><br> <br> <a
			href="viewFriend.jsp" class="ahref">View/Delete Friend</a><br> <br>
		<a href="viewFriend.jsp?type=update" class="ahref">Update Friend</a><br>
		<br>







	</form>
	<footer>
		<div class="social">
			<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
		</div>
		<p>Illinois State University 2014</p>

		<br class="clearfix" />
	</footer>
</body>
</html>



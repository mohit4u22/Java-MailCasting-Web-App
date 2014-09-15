<jsp:include page="header.jsp"></jsp:include>

<div id="parallax" style="top: 50px;"></div>

<%
	if (session.getAttribute("username") != null) {
		String username = (String) session.getAttribute("username");
		out.print("<p class='username'>Welcome " + username + "</p>");
	}

	else {
		request.setAttribute("Error1", "Please Do Login First");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>





<footer>
	<div class="social">
		<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
	</div>
	<p>Illinois State University 2014</p>

	<br class="clearfix" />
</footer>

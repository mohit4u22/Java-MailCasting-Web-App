<jsp:include page="header.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Friend</title>
<script src="http://code.jquery.com/jquery-2.1.0.js"
	type="text/javascript">
	
</script>
<script src="jaxrs.js" type="text/javascript"></script>
</head>
<body>
	<div id="parallax" style="top: 50px;"></div>
	<br>
	<br>
	<br>
	<br>
	<input type="hidden" name="email" id="viewfriendemail"
		value='<%=session.getAttribute("username")%>' />

	<div id="divViewFriends"></div>
	<footer>
	<div class="social">
		<a href="#"></a> <a href="#"></a> <a href="#"></a>
	</div>
	<p>Illinois State University 2014</p>

	<br class="clearfix" />
	</footer>
</body>
</html>
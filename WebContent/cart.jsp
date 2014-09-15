<jsp:include page="header.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Friend</title>
<script src="http://code.jquery.com/jquery-2.1.0.js" type="text/javascript">
</script>
<script src="jaxrs.js" type="text/javascript"></script>

<script type="text/javascript">

</script>

</head>
<body>
<div id="parallax" style="top: 50px;"></div>


<% 
if(session.getAttribute("username")!=null){
	String username=(String)session.getAttribute("username");		
	out.print("<p class='username'>Welcome "+username+"</p>");
	}
	else{
								request.setAttribute("Error1","Please Do Login First");
								%>
								<jsp:forward page="index.jsp"></jsp:forward>
									<%}
								
String username = (String) session.getAttribute("username");
%>
<br>
    <br>
    <br>
    <br>
    <br>
 <form name="myForm" id="myform">
 
 
    <h1>Friends List</h1>
    
    <table class="tClass">
					<tr><td>Name:</td><td> <input type="text" name="name" id="name"/><br/><br/></td></tr>
					<tr><td>Address 1: </td><td><input type="text" name="ad1" id="ad1"/><br/><br/></td></tr>
					<tr><td>Address 2: </td><td><input type="text" name="ad2" id="ad2"/><br/><br/></td></tr>
					<tr><td>City:</td><td> <input type="text" name="city" id="city"/><br/><br/></td></tr>
					<tr><td>State: </td><td><input type="text" name="state" id="state"/><br/><br/></td></tr>
					<tr><td>Country: </td><td><input type="text" name="country" id="country"/><br/><br/></td></tr>
					<tr><td>Zip: </td><td><input type="text" name="zip" id="zip"/><br/><br/></td></tr>
					<tr><td>Phone: </td><td><input type="text" name="phone" id="phone"/><br/><br/></td></tr>
					<tr><td></td><td><input type="hidden" name="email" id="email" value='<%=session.getAttribute("username") %>' /><br/><br/></td></tr>
					<tr><td></td><td><input type="button" value="Submit" id="submit" /></td></tr>
				</table>
    
    <div class="shoplist"></div>
    <ol id="list"></ol>
   </form> 

<footer>
              <div class="social">
                <a href="#"> </a>
                <a href="#"> </a>
                <a href="#"> </a>
              </div>
							<p>Illinois State University 2014</p>
              
							<br class="clearfix" />
						</footer>
</body>
</html>


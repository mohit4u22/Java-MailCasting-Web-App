<jsp:include page="loginheader.jsp"></jsp:include>


<link href="mycss1.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"
	type="text/javascript"></script>
<script src="jaxrs.js" type="text/javascript"></script>

<div id="parallax" style="top: 50px;"></div>


<script type="text/javascript">
	
</script>




<div class="4u">

	<section>



		<span> <br>
			<div>
				<%
					if (request.getAttribute("Error") != null) {
						String Error = (String) request.getAttribute("Error");
						out.print("<p class='error' >" + Error + "</p>");
					}

					if (request.getAttribute("Error1") != null) {
						System.out.print(request.getAttribute("Error1"));
						String Error1 = (String) request.getAttribute("Error1");
						out.print("<p class='error' >" + Error1 + "</p>");

					}

					if (request.getAttribute("register") != null) {
						System.out.print(request.getAttribute("register"));
						String register = (String) request.getAttribute("register");
						out.print("<p class='error' >" + register + "</p>");
					}
					if (request.getAttribute("logout") != null) {
						System.out.print(request.getAttribute("logout"));
						String logout = (String) request.getAttribute("logout");
						out.print("<p class='error' id='align' >" + logout + "</p>");
					}
				%>


				<form action="LoginServlet" method="post"
					onsubmit="return validity();">

					<div class="span-6">
						<div class="login">
							<h1>Welcome</h1>
							<div class="login-content">
								<label id="emailLabel">Please enter a valid email</label> <input
									id="email" placeholder="Email" type="text" name="email">
								<label id="passwordLabel">Please enter your password </label> <input
									type="password" id="password" placeholder="Password"
									name="password"><br> <input type="submit"
									value="Login">

							</div>
						</div>
					</div>
				</form></span>

	</section>

</div>



<footer>
	<div class="social">
		<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
	</div>
	<p>Illinois State University 2014</p>

	<br class="clearfix" />
</footer>



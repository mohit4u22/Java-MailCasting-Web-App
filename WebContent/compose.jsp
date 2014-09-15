<jsp:include page="header.jsp"></jsp:include>
<link href="mycss1.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"
	type="text/javascript"></script>

<div class="4u">

	<section>

		<ul class="small-image-list">

			<li>
				<div id="parallax" style="top: 50px;"></div>
				<div>
					<%
						if (session.getAttribute("username") != null) {
							String username = (String) session.getAttribute("username");
							out.print("<p class='loginname'>Welcome " + username
									+ "</font>");
						} else {
							request.setAttribute("Error1", "Please Do Login First");
					%>
					<jsp:forward page="index.jsp"></jsp:forward>
					<%
						}
					%>
					<%
						if (request.getAttribute("compose") != null) {
							String compose = (String) request.getAttribute("compose");
							out.print("<p class='compose'>" + compose + "</p>");
						}
						if (request.getAttribute("composeerr") != null) {
							String composeerr = (String) request.getAttribute("composeerr");
							out.print("<p class='compose'>" + composeerr + "</font>");
						}
					%>


				</div>

			</li>

			<form action="ComposeServlet">
				<div class="span-6">
					<div class="login">
						<h1>Compose Mail</h1>
						<div class="login-content">
							<br>
							<%
								if (request.getAttribute("status") != null) {
									String status = (String) request.getAttribute("status");
									out.print("<p class='username' id='status'>" + status + "</p>");
								}
							%>
							<input type="text" placeholder="To" name="reciever_id" /><br>
							<input type="text" placeholder="Subject" name="subject_id" /><br>
							<textarea rows="10" cols="50" name="message"
								placeholder="Message"></textarea>
							<br> <input type="submit" value="Send" />


						</div>
					</div>
				</div>
			</form>






		</ul>
	</section>

</div>
<div class="4u"></div>





<footer>
	<div class="social">
		<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
	</div>
	<p>Illinois State University 2014</p>

	<br class="clearfix" />
</footer>

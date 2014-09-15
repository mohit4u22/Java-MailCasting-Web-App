<jsp:include page="loginheader.jsp"></jsp:include>
<script src="jaxrs.js" type="text/javascript"></script>


<div id="parallax" style="top: 50px;"></div>

<div class="4u">

	<section>

		<ul class="small-image-list">
			<li><span> <span class='registration'>Registration
						Form</span><br> <%
 	if (request.getAttribute("registererror") != null) {
 		String msg = (String) request.getAttribute("registererror");
 		out.print("<font style='color:red'>" + msg);
 		out.print("</font><br/>");
 	}
 %>

					<form name="myForm1" action="RegisterServlet" onsubmit="return validateForm();">
						<table class="tClass">
							<tr>
								<td>Gmail Id:</td>
								<td><input type="text" name="email" /><br /> <br /></td>
							</tr>
							<tr>
								<td>Gmail Password:</td>
								<td><input type="password" name="password" /><br /> <br /></td>
							</tr>
							<tr>
								<td>Name:</td>
								<td><input type="text" name="name" /><br /> <br /></td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td>Male<input type="radio" name="gender" value="male">Female<input
									type="radio" name="gender" value="female" /><br /> <br /></td>
							</tr>
							<tr>
								<td>Contact Number:</td>
								<td><input type="text" name="mname" /><br /> <br /></td>
							</tr>
							<tr>
								<td>Country:</td>
								<td><input type="text" name="country" /><br /> <br /></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Submit" /></td>
							</tr>
						</table>
					</form>

			</span></li>



		</ul>
	</section>

</div>

</body>

<footer>
	<div class="social">
		<a href="#"> </a> <a href="#"> </a> <a href="#"> </a>
	</div>
	<p>Illinois State University 2014</p>

	<br class="clearfix" />
</footer>

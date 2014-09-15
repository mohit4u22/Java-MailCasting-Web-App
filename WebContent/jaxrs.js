function validateForm() {
	if (/^[\.\w\-]+@(gmail)\.(com)$/.test(myForm1.email.value)) {
		if (/^[\w\W]{6,}$/.test(myForm1.password.value)) {
			return true;
		}
		alert("Please enter your valid Gmail Password (atleast 6 characters long)!");
		return false;

	}
	alert("Please enter a valid Gmail address!");
	return false;

}

function validity() {
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	if (email == "" && password == "") {
		alert("Email id and password cannot be null");
		return false;
	}
}


function GetQueryStringParams(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}
	}
}

function DeleteFriend(id) {
	var conf = confirm('Are you sure, you want to delete this friend?');
	if (conf == true) {
		$.ajax({
			type : 'DELETE',
			url : '/Project/rs/store/items/' + id,

			'contentType' : 'application/json',
			success : function(response) {
				alert('Done successfully');
				window.location = window.location;
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);

			}
		});

	}
}
var dataToPass;
$(function() {

	if (location.href.indexOf("viewFriend") > -1) {
		var qstype = GetQueryStringParams('type');
		$
				.ajax({
					type : 'GET',
					url : '/Project/rs/store/items/'
							+ $('#viewfriendemail').val(),

					'contentType' : 'application/json',
					success : function(response) {
						var list = response.itemList;
						$('#list').empty();
						var i = 0;

						$('#divViewFriends').html('');
						var htmlValue = "<table border='1' class='table1' ><tr><td>Name</td><td>Addresss 1 </td><td>Addresss 2</td><td>City</td><td>State</td><td>Country</td><td>Zip</td><td>Phone</td><td>Action</td></tr>";

						while (i < list.length) {
							htmlValue = htmlValue + '<tr><td>'
									+ list[i].item.name + '</td><td>'
									+ list[i].item.ad1 + '</td><td>'
									+ list[i].item.ad2 + '</td><td>'
									+ list[i].item.city + '</td><td>'
									+ list[i].item.state + '</td><td>'
									+ list[i].item.country + '</td><td>'
									+ list[i].item.zip + '</td><td>'
									+ list[i].item.phone + '</td>';

							if (qstype == 'update') {
								htmlValue = htmlValue
										+ '<td><a href="updateFriend.jsp?id='
										+ list[i].item.id + '&name='
										+ list[i].item.name
										+ '">Update</a></td></tr>';

							} else if (qstype = 'delete') {

								htmlValue = htmlValue
										+ '<td><a onclick=DeleteFriend("'
										+ list[i].item.id
										+ '");>Delete</a></td></tr>';

							}
							htmlValue = htmlValue + '</tr>';

							i++;

						}
						htmlValue = htmlValue + '</table>';
						$('#divViewFriends').html(htmlValue);

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);

					}
				});

	}

	else if (location.href.indexOf("updateFriend") > -1) {

		// /Populate updateFiendFrom using Query string
		$('.clsUpdateForm #name').val(GetQueryStringParams('name'));
		$('.clsUpdateForm #ad1').val(GetQueryStringParams('ad1'));
		$('.clsUpdateForm #id').val(GetQueryStringParams('id'));

		$("#submit1").click(function(onSubmit) {

			var item = JSON.stringify({
				"item" : {
					id : $('.clsUpdateForm #id').val(),
					name : $('.clsUpdateForm #name').val(),
					ad1 : $('.clsUpdateForm #ad1').val(),
					ad2 : $('.clsUpdateForm #ad2').val(),
					city : $('.clsUpdateForm #city').val(),
					state : $('.clsUpdateForm #state').val(),
					country : $('.clsUpdateForm #country').val(),
					zip : $('.clsUpdateForm #zip').val(),
					phone : $('.clsUpdateForm #phone').val()
				}
			});

			$.ajax({
				type : 'PUT',
				url : '/Project/rs/store/items',
				data : item,
				dataType : "json",
				contentType : 'application/json',
				success : function(response) {
					alert("Done Successfully");
				}

			});
		});
	}

	$("#submit").click(function(onSubmit) {

		// To convert data obtained in string form to JSON
		
			var item = JSON.stringify({
				"item" : {
					email : $('#email').val(),
					id : " ",
					name : $('#name').val(),
					ad1 : $('#ad1').val(),
					ad2 : $('#ad2').val(),
					city : $('#city').val(),
					state : $('#state').val(),
					country : $('#country').val(),
					zip : $('#zip').val(),
					phone : $('#phone').val()
				}
			});
	
			$.ajax({
				type : 'POST',
				url : '/Project/rs/store/items',
				data : item,
				dataType : "json",
				contentType : 'application/json',
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);

				},
				success : function(resp) {
					alert("Done Successfully");
				}
			});
		
	});
});

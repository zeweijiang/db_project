<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="org.json.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script
	src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/d004434a5ff76e7b97c8b07c01f34ca69e635d97/src/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Database Project</title>
</head>
<body>
	<%
		if (request.getAttribute("message") != null) {
	%>
	<div class="alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only">Error:</span>
		<%=request.getAttribute("message")%>
	</div>
	<%
		}
	%>
	<%
		if (request.getAttribute("notify") != null) {
	%>
	<div class="alert alert-success" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only">Error:</span>
		<%=request.getAttribute("notify")%>
	</div>
	<%
		}
	%>
	<%
		if (session.getAttribute("username") == null) {
	%>
	<div>
		<div class="container">

			<form class="form-signin" action="Login" method="post">
				<h2 class="form-signin-heading">Please sign in</h2>
				<label for="inputEmail" class="sr-only">Email address</label> <input
					name="username" id="inputEmail" class="form-control"
					placeholder="Username" required autofocus> <label
					for="inputPassword" class="sr-only">Password</label> <input
					type="password" name="password" id="inputPassword"
					class="form-control" placeholder="Password" required>
				<div class="checkbox"></div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
					in</button>
			</form>

		</div>
		<!-- /container -->
	</div>
	<%
		} else {
	%>
	<div class="row">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project 1.3</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="./">Main</a></li>
					<li><a href="./Event">Events</a></li>
					<li><a href="./Customers">Customers</a></li>
					<li><a href="./Company">Company</a></li>
					<li><a href="./Activity">Activity</a></li>
					<li><a href="./Venue">Venue</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="./Logout">Sign out</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	<%
		if (request.getAttribute("type") == null) {
	%>
	<div class="jumbotron">
		<h1>Hello, This is Project 1.3!</h1>
		<p>This project is done by Zewei Jiang and Addisu Ermias Petros.</p>
	</div>
	<%
		}
	%>

	<%
		if (request.getAttribute("type") == "Event") {
				JSONArray a = (JSONArray) request.getAttribute("data");
				JSONArray customerid = (JSONArray) request
						.getAttribute("customerid");
				JSONArray companyid = (JSONArray) request
						.getAttribute("companyid");
				JSONArray eventtypeid = (JSONArray) request
						.getAttribute("eventtypeid");
				JSONArray venueid = (JSONArray) request
						.getAttribute("venueid");
	%>

	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Events</div>
		<div class="panel-body">
			<p>This tables shows current events</p>
		</div>

		<form class="form-inline" action="./Event" method="GET">
			<label for="exampleInputName2">CompanyName</label> <select
				name="cname" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < companyid.length(); i++) {
								JSONObject jo = companyid.getJSONObject(i);
				%>
				<option value="<%=jo.get("companyName")%>"><%=jo.get("companyName")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Activity</label> <select name="type"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < eventtypeid.length(); i++) {
								JSONObject jo = eventtypeid.getJSONObject(i);
				%>
				<option value="<%=jo.get("typeName")%>"><%=jo.get("typeName")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Registered By</label> <select
				name="id" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < customerid.length(); i++) {
								JSONObject jo = customerid.getJSONObject(i);
				%>
				<option value="<%=jo.get("email")%>"><%=jo.get("email")%></option>
				<%
					}
				%>
			</select>

			<div class='input-group date' id='datetimepicker1'>
				<input type='text' class="form-control" name="searchdate" /> <span
					class="input-group-addon"> <span
					class="glyphicon glyphicon-calendar"></span>
				</span>
			</div>

			<script type="text/javascript">
				$(function() {
					$('#datetimepicker1').datetimepicker();
				});
			</script>
			<button type="submit" class="btn btn-default">Search</button>
		</form>


		<!-- Table -->
		<table class="table">
			<thead>
				<tr>
					<th><a href="./Event?order=eid">eid</a></th>
					<th><a href="./Event?order=eventName">Event Name</a></th>
					<th><a href="./Event?order=companyName">Company</a></th>
					<th><a href="./Event?order=typeName">Event</a></th>
					<th><a href="./Event?order=starttime">Time</a></th>
					<th><a href="./Event?order=timebooked">Booked Time</a></th>
					<th><a href="./Event?order=email">Registered By</a></th>
					<th><a href="./Event?order=venueName">Venue Name</a></th>
					<th>Participants</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < a.length(); i++) {
								JSONObject jo = a.getJSONObject(i);
				%>
				<tr>
					<th scope="row"><%=jo.get("eid")%></th>
					<th><%=jo.get("eventName")%></th>
					<th><%=jo.get("companyName")%></th>
					<th><%=jo.get("typeName")%></th>
					<th><%=jo.get("starttime") + " to "
								+ jo.get("endtime")%></th>
					<th><%=jo.get("timebooked")%></th>
					<th><%=jo.get("email")%></th>
					<th><%=jo.get("venueName")%></th>
					<th>
						<%
							JSONArray joo = (JSONArray) request
												.getAttribute("array+" + jo.get("eid"));
										String cwf = "";
										for (int j = 0; j < joo.length(); j++) {
											cwf += ((JSONObject) (joo.get(j))).get("firstName")
													+ " "
													+ ((JSONObject) (joo.get(j)))
															.get("lastName");
											if (j != joo.length() - 1)
												cwf += ", ";
										}
										out.print(cwf);
						%>
					</th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="container">
		<h2>Add Event</h2>
		<form class="form-horizontal" role="form" action="AddEvent"
			method="POST">
			<div class="form-group">
				<label for="sel1">Event Name</label><input type="text" required
					class="form-control" name="eventName"
					placeholder="Enter event name">
			</div>
			<div class="form-group">
				<label for="sel1">CustomerID</label> <select class="form-control"
					name="cssn" id="sel1">
					<%
						for (int i = 0; i < customerid.length(); i++) {
									JSONObject jo = customerid.getJSONObject(i);
					%>
					<option value="<%=jo.get("cssn")%>"><%=jo.get("cssn") + " - " + jo.get("firstName")
								+ " " + jo.get("lastName")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="sel1">EventType</label> <select class="form-control"
					name="tid" id="sel1">
					<%
						for (int i = 0; i < eventtypeid.length(); i++) {
									JSONObject jo = eventtypeid.getJSONObject(i);
					%>
					<option value="<%=jo.get("tid")%>"><%=jo.get("typeName")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="sel1">SubcontractFirms </label> <select name="cid"
					class="form-control" id="sel1">
					<%
						for (int i = 0; i < companyid.length(); i++) {
									JSONObject jo = companyid.getJSONObject(i);
					%>
					<option value="<%=jo.get("cid")%>"><%=jo.get("companyName")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="sel1">From</label>
				<div class='input-group date' id='datetimepicker6'>
					<input type='text' class="form-control" name="startTime"
						placeholder="Select start time" required /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				<label for="sel1">To</label>
				<div class='input-group date' id='datetimepicker7'>
					<input type='text' class="form-control" name="endTime"
						placeholder="Select start time" required /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				<script type="text/javascript">
					$(function() {
						$('#datetimepicker6').datetimepicker();
						$('#datetimepicker7').datetimepicker();
						$("#datetimepicker6").on(
								"dp.change",
								function(e) {
									$('#datetimepicker7')
											.data("DateTimePicker").minDate(
													e.date);
								});
						$("#datetimepicker7").on(
								"dp.change",
								function(e) {
									$('#datetimepicker6')
											.data("DateTimePicker").maxDate(
													e.date);
								});
					});
				</script>
			</div>
			<div class="form-group">
				<label for="sel1">Venue </label> <select class="form-control"
					name="vid" id="sel1">
					<%
						for (int i = 0; i < venueid.length(); i++) {
									JSONObject jo = venueid.getJSONObject(i);
					%>
					<option value="<%=jo.get("vid")%>"><%=jo.get("venueName") + " : "
								+ jo.get("streetAddress") + ", "
								+ jo.get("city") + ", " + jo.get("state")
								+ ", " + jo.get("country") + ", "
								+ jo.get("zipCode")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>

	<div class="container">
		<h2>Add Participant</h2>
		<form class="form-horizontal" role="form" action="AddParticipants"
			method="POST">
			<div class="form-group">
				<label for="sel1">Event</label> <select class="form-control"
					name="eidforparticipant" id="sel1">
					<%
						for (int i = 0; i < a.length(); i++) {
									JSONObject jo = a.getJSONObject(i);
					%>
					<option value="<%=jo.get("eid")%>"><%=jo.get("eid") + " - " + jo.get("eventName")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="sel1">Enter SSN</label><input type="number" required
					class="form-control" name="ssnforparticipant"
					placeholder="Enter SSN">
			</div>
			<div class="form-group">
				<label for="sel1">Enter First Name</label><input type="text"
					required class="form-control" name="firstNameofParticipant"
					placeholder="Enter first name">
			</div>
			<div class="form-group">
				<label for="sel1">Enter Last Name</label><input type="text" required
					class="form-control" name="lastNameofParticipant"
					placeholder="Enter last name">
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Add</button>
				</div>
			</div>
		</form>
	</div>






	<%
		}
	%>



	<%
		if (request.getAttribute("type") == "Customer") {
				JSONArray a = (JSONArray) request.getAttribute("data");
				JSONArray customerid = (JSONArray) request
						.getAttribute("customerid");
	%>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Customers</div>
		<div class="panel-body">
			<p>This tables shows current Customers</p>
		</div>



		<form class="form-inline" action="./Customers" method="GET">
			<label for="exampleInputName2">telephoneNumber</label> <select
				name="telephoneNumber" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < customerid.length(); i++) {
								JSONObject jo = customerid.getJSONObject(i);
				%>
				<option value="<%=jo.get("telephoneNumber")%>"><%=jo.get("telephoneNumber")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Email</label> <select name="email"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < customerid.length(); i++) {
								JSONObject jo = customerid.getJSONObject(i);
				%>
				<option value="<%=jo.get("email")%>"><%=jo.get("email")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">First Name</label> <select
				name="firstName" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < customerid.length(); i++) {
								JSONObject jo = customerid.getJSONObject(i);
				%>
				<option value="<%=jo.get("firstName")%>"><%=jo.get("firstName")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Last Name</label> <select
				name="lastName" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < customerid.length(); i++) {
								JSONObject jo = customerid.getJSONObject(i);
				%>
				<option value="<%=jo.get("lastName")%>"><%=jo.get("lastName")%></option>
				<%
					}
				%>
			</select>
			<button type="submit" class="btn btn-default">Search</button>
		</form>



		<!-- Table -->
		<table class="table">
			<thead>
				<tr>
					<th><a href="./Customers?order=cssn">SSN</a></th>
					<th><a href="./Customers?order=telephoneNumber">Telephone
							Number</a></th>
					<th><a href="./Customers?order=email">Email</a></th>
					<th><a href="./Customers?order=firstName">First Name</a></th>
					<th><a href="./Customers?order=lastName">Last Name</a></th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < a.length(); i++) {
								JSONObject jo = a.getJSONObject(i);
				%>
				<tr>
					<th scope="row"><%=jo.get("cssn")%></th>
					<th><%=jo.get("telephoneNumber")%></th>
					<th><%=jo.get("email")%></th>
					<th><%=jo.get("firstName")%></th>
					<th><%=jo.get("lastName")%></th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>



	<div class="container">
		<h2>Add Customer</h2>
		<form class="form-horizontal" role="form" action="AddCustomer"
			method="POST">
			<div class="form-group">
				<label for="exampleInputEmail1">SSN</label> <input required
					type="number" class="form-control" id="exampleInputEmail1"
					name="rcssn" placeholder="Enter SSN">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					required type="email" class="form-control" id="exampleInputEmail1"
					name="remail" placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">First Name</label> <input
					required name="rfirstName" type="text" class="form-control"
					id="exampleInputPassword1" placeholder="First Name">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Last Name</label> <input required
					name="rlastName" type="text" class="form-control"
					id="exampleInputPassword1" placeholder="Last Name">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Number</label> <input required
					name="rphoneNumber" type="text" class="form-control"
					id="exampleInputPassword1" placeholder="Number">
			</div>
			<button type="submit" class="btn btn-default">Add Customer</button>
		</form>
	</div>

	<%
		}
	%>



	<%
		if (request.getAttribute("type") == "Company") {
				JSONArray a = (JSONArray) request.getAttribute("data");
				JSONArray companyid = (JSONArray) request
						.getAttribute("companyid");
	%>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Company</div>
		<div class="panel-body">
			<p>This tables shows current Companies</p>
		</div>

		<form class="form-inline" action="./Company" method="GET">

			<label for="exampleInputName2">Name</label> <select
				name="companyName" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < companyid.length(); i++) {
								JSONObject jo = companyid.getJSONObject(i);
				%>
				<option value="<%=jo.get("companyName")%>"><%=jo.get("companyName")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">City</label> <select name="city"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < companyid.length(); i++) {
								JSONObject jo = companyid.getJSONObject(i);
				%>
				<option value="<%=jo.get("city")%>"><%=jo.get("city")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">State</label> <select name="state"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < companyid.length(); i++) {
								JSONObject jo = companyid.getJSONObject(i);
				%>
				<option value="<%=jo.get("state")%>"><%=jo.get("state")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Country</label> <select
				name="country" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < companyid.length(); i++) {
								JSONObject jo = companyid.getJSONObject(i);
				%>
				<option value="<%=jo.get("country")%>"><%=jo.get("country")%></option>
				<%
					}
				%>
			</select>
			<button type="submit" class="btn btn-default">Search</button>
		</form>

		<!-- Table -->
		<table class="table">
			<thead>
				<tr>
					<th><a href="./Company?order=cid">cid</a></th>
					<th><a href="./Company?order=companyName">Name</a></th>
					<th>Can Work For</th>
					<th><a href="./Company?order=city">City</a></th>
					<th><a href="./Company?order=state">State</a></th>
					<th><a href="./Company?order=country">Country</a></th>

				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < a.length(); i++) {
								JSONObject jo = a.getJSONObject(i);
				%>
				<tr>
					<th scope="row"><%=jo.get("cid")%></th>
					<th><%=jo.get("companyName")%></th>
					<th>
						<%
							JSONArray joo = (JSONArray) request
												.getAttribute("companyid+" + jo.get("cid"));
										String cwf = "";
										for (int j = 0; j < joo.length(); j++) {

											cwf += ((JSONObject) (joo.get(j))).get("typeName");
											if (j != joo.length() - 1)
												cwf += ", ";
										}
										out.print(cwf);
						%>
					</th>
					<th><%=jo.get("city")%></th>
					<th><%=jo.get("state")%></th>
					<th><%=jo.get("country")%></th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		}
	%>







	<%
		if (request.getAttribute("type") == "Activity") {
				JSONArray a = (JSONArray) request.getAttribute("data");
				JSONArray eventtypeid = (JSONArray) request
						.getAttribute("eventtypeid");
	%>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">EventType</div>
		<div class="panel-body">
			<p>This tables shows current Event Types</p>
		</div>


		<form class="form-inline" action="./Activity" method="GET">

			<label for="exampleInputName2">Name</label> <select name="typeName"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < eventtypeid.length(); i++) {
								JSONObject jo = eventtypeid.getJSONObject(i);
				%>
				<option value="<%=jo.get("typeName")%>"><%=jo.get("typeName")%></option>
				<%
					}
				%>
			</select>
			<button type="submit" class="btn btn-default">Search</button>
		</form>


		<!-- Table -->
		<table class="table">
			<thead>
				<tr>
					<th><a href="./Activity?order=tid">tid</a></th>
					<th><a href="./Activity?order=typeName">TypeName</a></th>
					<th>Companies that support this event</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < a.length(); i++) {
								JSONObject jo = a.getJSONObject(i);
				%>
				<tr>
					<th scope="row"><%=jo.get("tid")%></th>
					<th><%=jo.get("typeName")%></th>
					<th>
						<%
							JSONArray joo = (JSONArray) request
												.getAttribute("eventtypeid+" + jo.get("tid"));
										String cwf = "";
										for (int j = 0; j < joo.length(); j++) {
											cwf += ((JSONObject) (joo.get(j)))
													.get("companyName");
											if (j != joo.length() - 1)
												cwf += ", ";
										}
										out.print(cwf);
						%>
					</th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		}
	%>







	<%
		if (request.getAttribute("type") == "Venue") {
				JSONArray a = (JSONArray) request.getAttribute("data");
				JSONArray venueid = (JSONArray) request
						.getAttribute("venueid");
	%>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Venues</div>
		<div class="panel-body">
			<p>This tables shows current Venues</p>
		</div>

		<form class="form-inline" action="./Venue" method="GET">

			<label for="exampleInputName2">Capacity greater than </label> <input
				required type="number" min="0" step="1" class="form-control"
				id="exampleInputName2" name="min"> <label
				for="exampleInputName2">Capacity less than</label> <input required
				type="number" min="0" step="1" class="form-control"
				id="exampleInputName2" name="max"> <label
				for="exampleInputName2">City</label> <select name="city"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < venueid.length(); i++) {
								JSONObject jo = venueid.getJSONObject(i);
				%>
				<option value="<%=jo.get("city")%>"><%=jo.get("city")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">State</label> <select name="state"
				class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < venueid.length(); i++) {
								JSONObject jo = venueid.getJSONObject(i);
				%>
				<option value="<%=jo.get("state")%>"><%=jo.get("state")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Country</label> <select
				name="country" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < venueid.length(); i++) {
								JSONObject jo = venueid.getJSONObject(i);
				%>
				<option value="<%=jo.get("country")%>"><%=jo.get("country")%></option>
				<%
					}
				%>
			</select> <label for="exampleInputName2">Zip code</label> <select
				name="zipCode" class="form-control" id="sel1">
				<option value="----"%>----</option>
				<%
					for (int i = 0; i < venueid.length(); i++) {
								JSONObject jo = venueid.getJSONObject(i);
				%>
				<option value="<%=jo.get("zipCode")%>"><%=jo.get("zipCode")%></option>
				<%
					}
				%>
			</select>
			<button type="submit" class="btn btn-default">Search</button>
		</form>

		<!-- Table -->
		<table class="table">
			<thead>
				<tr>
					<th><a href="./Venue?order=vid">vid</a></th>
					<th><a href="./Venue?order=roomNumber">room Number</a></th>
					<th><a href="./Venue?order=venueName">venue Name</a></th>
					<th><a href="./Venue?order=capacity">capacity</a></th>
					<th><a href="./Venue?order=dateOpened">Opened Date</a></th>
					<th><a href="./Venue?order=dateLastRenovated">Last
							Renovated</a></th>
					<th><a href="./Venue?order=streetAddress">Street Address</a></th>
					<th><a href="./Venue?order=city">City</a></th>
					<th><a href="./Venue?order=state">State</a></th>
					<th><a href="./Venue?order=country">Country</a></th>
					<th><a href="./Venue?order=zipCode">Zip Code</a></th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < a.length(); i++) {
								JSONObject jo = a.getJSONObject(i);
				%>
				<tr>
					<th scope="row"><%=jo.get("vid")%></th>
					<th><%=jo.get("roomNumber")%></th>
					<th><%=jo.get("venueName")%></th>
					<th><%=jo.get("capacity")%></th>
					<th><%=jo.get("dateOpened")%></th>

					<th><%=jo.get("dateLastRenovated")%></th>
					<th><%=jo.get("streetAddress")%></th>
					<th><%=jo.get("city")%></th>
					<th><%=jo.get("state")%></th>
					<th><%=jo.get("country")%></th>
					<th><%=jo.get("zipCode")%></th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		}
	%>
	<%
		}
	%>
</body>
</html>
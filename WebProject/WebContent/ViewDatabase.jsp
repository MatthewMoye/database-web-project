<%@ page import="test.SQLConnection"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-green.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <!-- <link rel="stylesheet" href="@routes.Assets.versioned("stylesheets/font-awesome.min.css")"> -->
        <title>CIDS: View Database</title>
    </head>
    <style>
        body {font-family: "Lato", sans-serif}
        .mySlides {display: none}
        body {
  background-image: url('https://i.imgur.com/ygRkA5G.gif');
  background-repeat: no-repeat;
  background-attachment: fixed; 
  background-size: 100% 100%;
}
    </style>
    <body>
<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-black w3-card-4 w3-xlarge">
        <a class="w3-bar-item w3-button w3-padding-large w3-hide-large w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="Home.jsp" class="w3-bar-item w3-button w3-padding-large"><b>C.I.D.S.</b></a>
        <a href="About.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">ABOUT</a>
        <a href="Welcome.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">WELCOME</a>
        <a href="ViewDatabase.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">VIEW DATABASE</a>
        <a href="UpdateDatabase.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">UPDATE DATABASE</a>
		<a href="UpdateDatabase_AddTo.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">ADD TO DATABASE</a>        
        <a href="SpecialSearch.jsp" class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-padding-large">SPECIAL SEARCH</a>
        
    </div>
</div>
  
  <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
  <div id="smallNav" class="w3-bar-block w3-black w3-hide w3-hide-large w3-top w3-card-4 w3-xlarge" style="margin-top:46px">
      <a href="About.jsp" class="w3-bar-item w3-button" onclick="myFunction()">ABOUT</a>
      <a href="Welcome.jsp" class="w3-bar-item w3-button" onclick="myFunction()">WELCOME</a>
      <a href="ViewDatabase.jsp" class="w3-bar-item w3-button" onclick="myFunction()">VIEW DATABASE</a>
      <a href="UpdateDatabase.jsp" class="w3-bar-item w3-button" onclick="myFunction()">UPDATE DATABASE</a>
      <a href="UpdateDatabase_AddTo.jsp" class="w3-bar-item w3-button" onclick="myFunction()">ADD TO DATABASE</a>		     
      <a href="SpecialSearch.jsp" class="w3-bar-item w3-button" onclick="myFunction()">SPECIAL SEARCH</a>
  </div>


	<!-- Header -->
	<header class="w3-container w3-center" style="padding: 128px 16px">
		<h1 class="w3-margin w3-jumbo">View Database Tables</h1>
		<h1 class="w3-margin w3-xxxlarge">Basic Search</h1>

		<!-----------------------------------QUERY DONE HERE--------------------------------------------------------------------------------------------------------------------------------->
		<!-- The action taken for the input needs to change to best suit java way. -->
		<div class="w3-container w3-center w3-padding-large">
			<FORM ACTION="ViewDatabase.jsp" method="post">
				<div class="w3-bar w3-padding-large">
					<select
						class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						name="Table option" style="width: 450px;">
						<option value="" disabled selected>Search From a Table</option>
						<option value="Project">Projects</option>
						<option value="Users">Users</option>
						<option value="Sector">Sectors</option>
						<option value="State">States</option>
						<option value="City">Cities</option>
						<option value="Type">Types</option>
					</select>
					<button
						class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						role="button" type="submit" value="submit">
						<b>Submit</b> <i class="fa fa-search"></i>
					</button>
				</div>
			</FORM>
		</div>
		<%
			String table = request.getParameter("Table option");
			//String query = request.getParameter("query");
			try {
			if (table != null) {
				String query = "select * from " + table + " ;";
				SQLConnection sq = new SQLConnection();
				ResultSet r = sq.result(query);
				ResultSetMetaData rsmd = r.getMetaData();
				int numOfColumns = rsmd.getColumnCount();
				%>
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
    				<div class="w3-bar w3-padding-large">	
						<input class="w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="quickSearch" type="text" placeholder="Type keyword to search" style="width: 450px;" id="myInput">
					</div>
				</div>
				<%
				if ("Project".equals(table)) {
		%>
		<div class="w3-responsive" style="margin: auto; max-width: 1200px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 60%">Project ID</th>
						<th style="width: 60%">Project Name</th>
						<th style="width: 40%">City ID</th>
						<th style="width: 40%">Project Lead ID</th>
						<th style="width: 40%">Description</th>
						<th style="width: 40%">Start Date</th>
						<th style="width: 40%">Deadline</th>
						<th style="width: 40%">Completion Date</th>
						<th style="width: 40%">Status</th>
						<th style="width: 40%">Estimated Cost</th>
						<th style="width: 40%">Final Cost</th>
						<th style="width: 40%">Project Type</th>
					</tr>
				</thead>
				<tbody id="myTable">
				<%
					while (r.next()) {
				%>
					<TR>
						<%
							for (int a = 1; a <= numOfColumns; a++) {
						%>
						<td style="width: 40%"><%=r.getString(a)%></td>
						<%
							}
						%>
					</TR>
				<%
					}
				%>
				</tbody>
			</TABLE>
		</div>
		<%
			} else if ("Users".equals(table)) {
		%>
		<div class="w3-responsive" style="margin: auto; max-width: 1200px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 40%">User ID</th>
						<th style="width: 40%">First Name</th>
						<th style="width: 40%">MI</th>
						<th style="width: 40%">Last Name</th>
						<th style="width: 40%">Admin</th>
					</tr>
				</thead>
				<tbody id="myTable">
				<%
					while (r.next()) {
				%>

				<TR>
					<%
						for (int a = 1; a <= numOfColumns; a++) {
					%>
					<td style="width: 60%"><%=r.getString(a)%></td>
					<%
						}
					%>
				</TR>
				<%
					}
				%>
				</tbody>
			</TABLE>
		</div>
		<%
				} else if ("Sector".equals(table)) {
			%>
		<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 60%">Sector ID</th>
						<th style="width: 40%">Sector Name</th>
						<th style="width: 40%">Sector Lead ID</th>
						<th style="width: 40%">Sector Lead Start Date</th>
					</tr>
				</thead>
				<tbody  id="myTable">
				<%
						while (r.next()) {
					%>
				<TR>
					<%
							for (int a = 1; a <= numOfColumns; a++) {
						%>
					<td style="width: 40%"><%=r.getString(a)%></td>
					<%
							}
						%>
				</TR>
				<%
						}
					%>
				</tbody>
			</TABLE>
		</div>
		<%
				} else if ("State".equals(table)) {
			%>
		<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 60%">State Name</th>
						<th style="width: 40%">Sector ID</th>
						<th style="width: 40%">State Lead ID</th>
					</tr>
				</thead>
				<tbody  id="myTable">
				<%
						while (r.next()) {
					%>
				<TR>
					<%
							for (int a = 1; a <= numOfColumns; a++) {
						%>
					<td style="width: 40%"><%=r.getString(a)%></td>
					<%
							}
						%>
				</TR>
				<%
						}
					%>
				</tbody>
			</TABLE>
		</div>
		<%
				} else if("City".equals(table)){
					%>
		<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 60%">City ID</th>
						<th style="width: 40%">City Name</th>
						<th style="width: 40%">State</th>
						<th style="width: 40%">City Lead ID</th>
					</tr>
				</thead>
				<tbody id="myTable">
				<%
						while (r.next()) {
					%>
				<TR>
					<%
							for (int a = 1; a <= numOfColumns; a++) {
						%>
					<td style="width: 40%"><%=r.getString(a)%></td>
					<%
							}
						%>
				</TR>
				<%
						}
					%>
				</tbody>
			</TABLE>
		</div>
		<%
				} else if("Type".equals(table)){
					%>
		<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
			<table class="w3-table-all w3-card-4">
				<thead>
					<tr class="w3-black">
						<th style="width: 60%">Type ID</th>
						<th style="width: 40%">Type Name</th>
					</tr>
				</thead>
				<tbody id="myTable">
				<%
						while (r.next()) {
					%>
				<TR>
					<%
							for (int a = 1; a <= numOfColumns; a++) {
						%>
					<td style="width: 40%"><%=r.getString(a)%></td>
					<%
							}
						%>
				</TR>
				<%
						}
					%>
				</tbody>
			</TABLE>
		</div>
		<%
				} else{
					%>
		<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
			<table class="w3-table-all w3-card-4" id="myTable">
				<tr class="w3-black">
					<th style="width: 40%"><span>No Such Table Exists</span></th>
				</tr>
			</table>
		</div>

		<%
				}
			}
			}
			catch(SQLException e){}
			%>

	</header>

	<footer class="w3-container w3-padding-64 w3-center w3-xlarge">
    	<p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" class="w3-hover-text-blue" target="_blank">w3.css</a></p>
    </footer>
	<!-- Java Script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		</script>
	
	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("smallNav");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>
	<!-- Could use a separate script file to make this code look cleaner. Just worried about the variables. -->
	<!-- <script src="@routes.Assets.versioned("javascripts/main.js")" type="text/javascript"></script> -->
</body>
</html>

<%@page import="javax.naming.ldap.Rdn"%>
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
        <title>CIDS: Update Database</title>
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

	
	<% 
	SQLConnection sq = new SQLConnection();
	if(null!=request.getParameter("update") && !"".equals(request.getParameter("update"))){
		if("Project".equals(session.getAttribute("TABLE1"))){
			boolean success = sq.UpdateOrDelete("UPDATE Project SET " + request.getParameter("Select Attribute") + "='" + request.getParameter("update") + "' WHERE PID=" + request.getParameter("PID") + ";");
			if(success==false){
				%>
				<!-- Create modal that pops up saying deletion failed -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to update project in database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
			} else{
				%>
				<!-- Alert box for successful deletion -->
			<div class="w3-panel w3-green w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Success!</strong></h3>
			  <p><b><i>Project successfully updated in the database!!!</i></b><br>You can close this alert box.</p>
			</div>
		<%
			}
		} else if("Users".equals(session.getAttribute("TABLE1"))){
			boolean success = sq.UpdateOrDelete("UPDATE Users SET " + request.getParameter("Select Attribute") + "='" + request.getParameter("update") + "' WHERE UserID=" + request.getParameter("UserID") + ";");
			if(success==false){
				%>
				<!-- Create modal that pops up saying deletion failed -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to update user from database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
			} else{
				%>
				<!-- Alert box for successful deletion -->
			<div class="w3-panel w3-green w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Success!</strong></h3>
			  <p><b><i>User successfully updated in the database!!!</i></b><br>You can close this alert box.</p>
			</div>
		<%
			}
		}
	}
	%>

	<!-- Content area -->
	<div class="w3-container w3-center w3-padding-large">
		<FORM ACTION="UpdateDatabase.jsp" method="post">
			<div class="w3-bar w3-padding-large">
			<header class="w3-container w3-center" style="padding-top: 70px">
				<h1 class="w3-margin w3-jumbo">Update Database</h1>
			</header>
       			<div class="w3-bar w3-padding-large">
					<select
						class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						name="Table option" style="width: 450px;">
						<option value="" disabled selected>Search From a Table</option>
						<option value="Project">Projects</option>
						<option value="Users">Users</option>
					</select>
					<button
						class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						role="button" type="submit" value="submit">
						<b>Submit</b> <i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</FORM>
	</div>
	<%
		String table = request.getParameter("Table option");
		session.setAttribute("TABLE1", table);
		if("Project".equals(table)){
			%>
			<div class="w3-container w3-bar w3-center w3-padding-large">
				<div class="w3-card-4 w3-dark-gray" style="margin: auto; width: 775px">
					<form ACTION="UpdateDatabase.jsp" method="post">
					<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
	        			<div class="w3-bar w3-padding-large">	
							<input class=" w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="delete" type="text" placeholder="Type project id to delete from database" style="width: 450px;" id="myInput">
							<button class="w3-bar-item w3-button w3-red w3-card-4 w3-padding-large w3-xlarge"
							style="width: 150px;" role="button" type="submit" value="submit">Delete</button>
						</div>
					</div>
					</form>
				</div>
				<div class="w3-card-4 w3-light-blue w3-padding-large" style="margin: auto; width: 775px">
				<form ACTION="UpdateDatabase.jsp" method="post">
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
						<input class=" w3-bar w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="PID" type="text" placeholder="Type project id to update in database" style="width: 450px;" id="myInput">
					</div>
				</div>
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
					<select
						class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						name="Select Attribute" style="width: 450px;">
						<option value="" disabled selected>Select attribute to update</option>
						<option value="Deadline">Deadline</option>
						<option value="CompletionDate">Completion Date</option>
						<option value="Status">Status</option>
						<option value="FinalCost">Final Cost</option>
					</select>
					</div>
				</div>
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
						<input class=" w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="update" type="text" placeholder="Type attribute change" style="width: 450px;" id="myInput">
						<button class="w3-bar-item w3-button w3-blue w3-card-4 w3-padding-large w3-xlarge"
						style="width: 150px;" role="button" type="submit" value="submit">Update</button>
					</div>
				</div>
				</form>
				</div>
				<div class="w3-container w3-xlarge w3-center w3-padding-36 w3-card-4 w3-blue-gray" style="margin: auto; margin-top: 15px; width: 775px">
    				<div class="w3-bar w3-padding-large">	
						<input class="w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="quickSearch" type="text" placeholder="Type keyword to search table" style="width: 450px;" id="myInput3">
					</div>
				</div>
			</div>
		<%
		}
			
		if("Users".equals(table)){
			%>
			<div class="w3-container w3-bar w3-center w3-padding-large">
				<div class="w3-card-4 w3-light-blue" style="margin: auto; width: 775px">
				<form ACTION="UpdateDatabase.jsp" method="post">
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
						<input class=" w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="UserID" type="text" placeholder="Type user id to update from database" style="width: 450px;" id="myInput1">
					</div>
				</div>
					<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        				<div class="w3-bar w3-padding-large">
							<select
								class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
								name="Select Attribute" style="width: 450px;">
								<option value="" disabled selected>Select attribute to update</option>
								<option value="FirstName">First Name</option>
								<option value="MiddleInitial">Middle Initial</option>
								<option value="LastName">Last Name</option>
							</select>
					</div>
				</div>
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
						<input class=" w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="update" type="text" placeholder="Type attribute change" style="width: 450px;" id="myInput">
						<button class="w3-bar-item w3-button w3-blue w3-card-4 w3-padding-large w3-xlarge"
						style="width: 150px;" role="button" type="submit" value="submit">Update</button>
					</div>
				</div>
			</form>
			</div>
			<div class="w3-container w3-xlarge w3-center w3-padding-36 w3-card-4 w3-blue-gray" style="margin: auto; width: 775px">
		 		<div class="w3-bar w3-padding-large">	
					<input class="w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="quickSearch" type="text" placeholder="Type keyword to search table" style="width: 450px;" id="myInput3">
				</div>
			</div>
		</div>
		<%
		}
		if(null!=request.getParameter("delete") && !"".equals(request.getParameter("delete"))){
			boolean success = sq.UpdateOrDelete("DELETE FROM Project WHERE PID=" + request.getParameter("delete") + ";");
			if(success==false){
				%>
				<!-- Create modal that pops up saying deletion failed -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to delete from database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
			} else{
				%>
				<!-- Alert box for successful deletion -->
			<div class="w3-panel w3-green w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Success!</strong></h3>
			  <p><b><i>Project successfully deleted from the database!!!</i></b><br>You can close this alert box.</p>
			</div>
		<%
			}
		}
		
		if (table != null) {
			String query = "select * from " + table + " ;";
			ResultSet r = sq.result(query);
			ResultSetMetaData rsmd = r.getMetaData();
			int numOfColumns = rsmd.getColumnCount();
			
			System.out.println("here");
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
				<th style="width: 60%">First Name</th>
				<th style="width: 40%">MI</th>
				<th style="width: 40%">Last Name</th>
				<th style="width: 40%">Admin</th>
				<th style="width: 40%">User ID</th>
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
		} else {
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
	%>
	<%
		}
	%>

	<footer class="w3-container w3-padding-64 w3-center w3-xlarge">
    	<p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" class="w3-hover-text-blue" target="_blank">w3.css</a></p>
    </footer>
	<!-- Java Script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
		  $("#myInput3").on("keyup", function() {
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

		//For some reason this function doesn't work properly, or how the tables are displayed
		//has difficulty displaying correctly.
		function searchTableFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	<!-- Could use a separate script file to make this code look cleaner. Just worried about the variables. -->
	<!-- <script src="@routes.Assets.versioned("javascripts/main.js")" type="text/javascript"></script> -->
</body>
</html>
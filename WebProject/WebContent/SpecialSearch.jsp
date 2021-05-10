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
        <title>CIDS: Special Search</title>
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
	%>

	<!-- Content area -->
	<div class="w3-container w3-center w3-padding-large">
		<FORM ACTION="SpecialSearch.jsp" method="post">
			<div class="w3-bar w3-padding-large">
			<header class="w3-container w3-center" style="padding-top: 70px">
				<h1 class="w3-margin w3-jumbo">Special Search</h1>
				</header>
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        			<div class="w3-bar w3-padding-large">
						<select
							class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
							name="queryType" style="width: 450px;">
							<option value="" disabled selected>Select Special Search</option>
							<option value="Select Users.* from Users, Project where UserID = ProjectLeadID and PID=">User who worked on Project with PID</option>
							<option value="Select Project.* from Project, City, State, Sector where City = CityID and State = StateName and SectorID = ID and ID =">All projects in SectorID</option>
							<option value="Select Users.* from Users, Project, City, State, Sector where UserID = ProjectLeadID and City = CityID and State = StateName and SectorID = ID and SectorName =">All users working on project in certain Sector by Sector Name</option>
							<option value="Select Users.* from Users, Project, City, State, Sector where UserID = ProjectLeadID and City = CityID and State = StateName and SectorID = ID and ID =">All users working on project in SectorID</option>
							<option value="Select City.* from City, State, Sector where State = StateName and SectorID = ID and SectorName =">All cities in certain Sector by Sector Name</option>
							<option value="Select City.* from City, State, Sector where State = StateName and SectorID = ID and ID =">All cities in SectorID</option>
							
							<option value="Select Project.* from Project, Type where ProjectType=TypeID and TypeName =">All projects of certain Type by Type Name</option>
							<option value="Select Project.* from Project where EstimatedCost <">All projects with Estimated Cost lower than...</option>
							<option value="Select Users.* from Users, Project, Type where UserID=ProjectLeadID and TypeID=ProjectType and TypeName =">All users who work on projects of certain project type</option>
							<option value="Select State.* from State, Project, City, Type where State=StateName and City=CityID and ProjectType=TypeID and TypeName =">All states that have projects of project type...</option>
							<option value="Select Users.* from Users, Project where UserID=ProjectLeadID and Status =">All users with certain project status</option>
							
							<option value="Select Project.* from Project, City, State where City=CityID and State=StateName and StateName =">All projects from state</option>
							<option value="Select Project.* from Project, Sector, State, City where ID=SectorID and StateName=State and CityID=City and ID =">The status of every project in SectorID</option>
							<option value="Select Sector.* from Sector, City, State where State=StateName and SectorID=ID and StateName =">Sector that state is in that has StateName</option>
							<option value="Select Users.* from Users, City where UserID=CityLeadID and CityName =">Every user from CityName</option>
							<option value="Select Users.* from Users, Project where CompletionDate is not null and UserID = ProjectLeadID">Every user who has completed a project (Type any character into keyword search)</option>
							
							<option value="Select Project.* from Project, City where CityID = City and CityID =">All Projects from CityID</option>
							<option value="Select Project.* from Project, City where City = CityID and CityName =">All Projects from a certain City by City Name</option>
							<option value="Select Users.* from Users, Project where UserID = ProjectLeadID and ProjectName =">Users who worked on certain Project by Project Name</option>
							<option value="Select Project.* from Project, City, State, Sector where City = CityID and State = StateName and SectorID = ID and SectorName =">All projects in certain Sector by Sector Name</option>
							<option value="Select Project.* from Project where CompletionDate is null;">Projects not finished (Type any character into keyword search)</option>
							
							
						</select>
						</div>
				</div>
					
				<div class="w3-container w3-xlarge w3-center w3-padding-36" style="margin: auto;">
        				<div class="w3-bar w3-padding-large">
        					<input class=" w3-bar-item w3-input w3-border w3-card-4 w3-padding-large w3-xlarge" name="query" type="text" placeholder="Type keyword for special search" style="width: 450px;" id="myInput">
        					<button class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-card-4" role="button" type="submit" value="submit">
								<b>Submit</b> <i class="fa fa-search"></i>
							</button>
        				</div>
        		</div>
			</div>
		</FORM>
	</div>
	<%
	
		String specificQuery = "Select Users.* from Users, Project where CompletionDate is not null and UserID = ProjectLeadID"; 
		String query = request.getParameter("query");
		String statement = request.getParameter("queryType");
		String table = "";
		String[] split;
		if (statement!=null && !statement.equals("")) {
			split = statement.split(" ", 5);
			if(split[3].substring(split[3].length() - 1).equals(","))
				table = split[3].substring(0, split[3].length() -1);
			else
				table = split[3].substring(0, split[3].length());
			System.out.println(table);
		}
		try {
		if (query != null && !query.equals("") && statement!=null && !statement.equals("")) {
			try {
				query = statement + " " + Integer.parseInt(query) + ";";
			}
			catch (NumberFormatException n) {
				query = statement + "'" + query + "';";
			}
			System.out.println(statement.substring(statement.length()-1));
			if(!statement.substring(statement.length()-1).equals("=")&&!statement.substring(statement.length()-1).equalsIgnoreCase("<"))
				query = statement;
			System.out.println(query);
			ResultSet r = sq.result(query);
			ResultSetMetaData rsmd = r.getMetaData();
			int numOfColumns = rsmd.getColumnCount();
			if(r.first()!=false){
				r.previous();
			if ("Project".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1200px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">Project ID</th>
				<th style="width: 60%">Project Name</th>
				<th style="width: 40%">City</th>
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
		</TABLE>
	</div>
	<%
		} else if ("Users".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1200px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">First Name</th>
				<th style="width: 40%">MI</th>
				<th style="width: 40%">Last Name</th>
				<th style="width: 40%">Admin</th>
				<th style="width: 40%">User ID</th>
			</tr>
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
		</TABLE>
	</div>
	<%
		} else if ("Sector".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">Sector ID</th>
				<th style="width: 40%">Sector Name</th>
				<th style="width: 40%">Sector Lead ID</th>
				<th style="width: 40%">Sector Lead Start Date</th>
			</tr>
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
		</TABLE>
	</div>
	<%
		} else if ("State".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">State Name</th>
				<th style="width: 40%">Sector ID</th>
				<th style="width: 40%">State Lead ID</th>
			</tr>
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
		</TABLE>
	</div>
	<%
		} else if ("City".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">City ID</th>
				<th style="width: 40%">City Name</th>
				<th style="width: 40%">State</th>
				<th style="width: 40%">City Lead ID</th>
			</tr>
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
		</TABLE>
	</div>
	<%
		} else if ("Type".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1000px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
				<th style="width: 60%">Type ID</th>
				<th style="width: 40%">Type Name</th>
			</tr>
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
	<!-- Create modal that pops up saying invalid search -->
		<div class="w3-panel w3-blue w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; max-width:500px">
		  <span onclick="this.parentElement.style.display='none'"
		  class="w3-button w3-large w3-display-topright">&times;</span>
		  <h3><strong>Sorry!</strong></h3>
		  <p><i>Nothing resulted from your search!</i><br>Please try a different search.</p>
		</div>

	<%
		}
			}else{
				%>
				<!-- Create modal that pops up saying invalid search -->
			<div class="w3-panel w3-blue w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Sorry!</strong></h3>
			  <p><i>Nothing resulted from your search!</i><br>Please try a different search.</p>
			</div>
				<%
			}
		}
		}
		catch(SQLException e) {
			%>
			<!-- Create modal that pops up saying invalid search -->
			<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Error!</strong></h3>
			  <p><i>Invalid Search!</i><br>Please try a different search.</p>
			</div>
<%
			
		} catch(NullPointerException e){
			%>
			<!-- Create modal that pops up saying invalid search -->
			<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Error!</strong></h3>
			  <p><i>Invalid Search!</i><br>Please try a different search.</p>
			</div>
<%
		} catch(Exception e){
			%>
			<!-- Create modal that pops up saying invalid search -->
			<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; max-width:500px">
			  <span onclick="this.parentElement.style.display='none'"
			  class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3><strong>Error!</strong></h3>
			  <p><i>Invalid Search!</i><br>Please try a different search.</p>
			</div>
<%
		}
	%>

	<footer class="w3-container w3-padding-64 w3-center w3-xlarge">
    	<p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" class="w3-hover-text-blue" target="_blank">w3.css</a></p>
    </footer>
	<!-- Java Script -->
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
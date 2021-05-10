
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
        <title>CIDS: Add to Database</title>
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
	try{
		session.setAttribute("COUNT", "0");
		System.out.println(session.getAttribute("COUNT"));
		System.out.println(session.getAttribute("TABLE"));
		System.out.println(request.getParameter("create"));
		if (request.getParameter("update1")!=null && !request.getParameter("update1").equals("")) {
			System.out.println("Success1" + session.getAttribute("TABLE"));
			String create = "Insert INTO ";
			try{
			if(session.getAttribute("TABLE").equals("Users")){
				session.setAttribute("COUNT", "Users");
				System.out.println("Success1.1");
				create += session.getAttribute("TABLE") + "(FirstName, MiddleInitial, LastName, Admin)"
						+ " values (";
			} else if(session.getAttribute("TABLE").equals("Project")){
				create += session.getAttribute("TABLE") + "(ProjectName, City, ProjectLeadID, Description, StartDate, Deadline, CompletionDate, Status, EstimatedCost, FinalCost, ProjectType)"
						+ " values (";
			}
			} catch(Exception e){
				%>
				<!-- Create modal that pops up saying invalid update -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
			}
			int a = 1;
			SQLConnection sq = new SQLConnection();
			if(session.getAttribute("TABLE")!=null)
			if(session.getAttribute("TABLE").equals("Project")){
				session.setAttribute("Count", "Project");
				System.out.println("Success2.1a");
				if((request.getParameter("update1")!=null && !request.getParameter("update1").equals(""))
						&& (request.getParameter("update2")!=null && !request.getParameter("update2").equals(""))
						&& (!request.getParameter("update3").equals("")) 
						&& (request.getParameter("update4")!=null && !request.getParameter("update4").equals(""))
						&& (request.getParameter("update5")!=null && !request.getParameter("update5").equals(""))
						&& (request.getParameter("update6")!=null && !request.getParameter("update6").equals(""))
						&& (!request.getParameter("update7").equals(""))
						&& (request.getParameter("update8")!=null && !request.getParameter("update8").equals(""))
						&& (request.getParameter("update9")!=null && !request.getParameter("update9").equals(""))
						&& (!request.getParameter("update10").equals(""))
						&& (request.getParameter("update11")!=null && !request.getParameter("update11").equals(""))){
					while(a<=11) {
						if (a != 1)
							create += ",";
						if(request.getParameter("update"+a).equals("null")){
							create += request.getParameter("update"+a);
						} else{
							create += "'" + request.getParameter("update"+a) + "'";
						}
						a++;
					}
					create += ");";
					boolean success = sq.UpdateOrDelete(create);
					if(success==false){
						%>
				<!-- Create modal that pops up saying invalid search -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
					} else{
						%>
						<!-- Alert box for succesful addition -->
					<div class="w3-panel w3-green w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
					  <span onclick="this.parentElement.style.display='none'"
					  class="w3-button w3-large w3-display-topright">&times;</span>
					  <h3><strong>Success!</strong></h3>
					  <p><b><i>Project successfully added to the database!!!</i></b><br>You can close this alert box.</p>
					</div>
				<%
					}
				} else{
					%>
					<!-- Create modal that pops up saying invalid update -->
					<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
					  <span onclick="this.parentElement.style.display='none'"
					  class="w3-button w3-large w3-display-topright">&times;</span>
					  <h3><strong>Error!</strong></h3>
					  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
					</div>
					<%
				}
			} else if(session.getAttribute("TABLE").equals("Users")){
				if((request.getParameter("update1")!=null && !request.getParameter("update1").equals(""))
						&& (!request.getParameter("update2").equals(""))
						&& (request.getParameter("update3")!=null && !request.getParameter("update3").equals(""))
						&& (request.getParameter("update4")!=null && !request.getParameter("update4").equals(""))){
					System.out.println("Success2a");
				while(a<=4) {
					if (a != 1)
						create += ",";
					if(request.getParameter("update"+a).equals("null")){
						create += request.getParameter("update"+a);
					} else{
						create += "'" + request.getParameter("update"+a) + "'";
					}
					a++;
				}
				create += ");";
				boolean success = sq.UpdateOrDelete(create);
				if(success==false){
					%>
				<!-- Create modal that pops up saying invalid update -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
				} else{
					%>
					<!-- Alert box for succesful addition -->
				<div class="w3-panel w3-green w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Success!</strong></h3>
				  <p><b><i>User successfully added to the database!!!</i></b><br>You can close this alert box.</p>
				</div>
			<%
				}
			} else{
				%>
				<!-- Create modal that pops up saying invalid update -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
			}
			}
		} else if(session.getAttribute("TABLE")!=null && request.getParameter("update1").equals("") && request.getParameter("create")!=null ){
			if(request.getParameter("create").equals("Create")){
				System.out.println(session.getAttribute("TABLE"));
				%>
				<!-- Create modal that pops up saying invalid update -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%	
			}
		}
	} catch(SQLException e) {
		%>
				<!-- Create modal that pops up saying invalid update -->
				<div class="w3-panel w3-red w3-display-container w3-card-4 w3-animate-bottom" style="margin: auto; margin-top: 110px; max-width:500px">
				  <span onclick="this.parentElement.style.display='none'"
				  class="w3-button w3-large w3-display-topright">&times;</span>
				  <h3><strong>Error!</strong></h3>
				  <p><b><i>Attempt to add to database failed!!!</i></b><br>Please check your input parameters.</p>
				</div>
				<%
	}
	%>
		<input type="hidden" name="Table option" value="${table}">
	
	<FORM ACTION="UpdateDatabase_AddTo.jsp" method="post">
	<!-- Content area -->
	<div class="w3-container w3-center w3-padding-large">
			<div class="w3-bar w3-padding-large">
			<header class="w3-container w3-center" style="padding: 128px 16px">
			<h1 class="w3-margin w3-jumbo">Add to Database</h1>
				<!-- Button -->
				<div class="w3-bar w3-padding-large">
					<select
						class="w3-select w3-border w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						name="Table option" style="width: 450px;">
						<option value="" disabled selected>Search From a Table</option>
						<option value="Project">Projects</option>
						<option value="Users">Users</option>
					</select>
				</div>
				<div class="w3-bar w3-padding-large">
					<button
						class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-card-4"
						role="button" type="submit" value="submit" name="submit">
						<b>Submit</b> <i class="fa fa-search"></i>
					</button>
				</div>
				</header>
			</div>
	</div>
	<%
		String table = request.getParameter("Table option");
		session.setAttribute("TABLE", table);
		if (table != null) {
			if ("Project".equals(table)) {
	%>
	<div class="w3-responsive" style="margin: auto; max-width: 1200px;">
		<table class="w3-table-all w3-card-4" id="myTable">
			<tr class="w3-black">
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
			<TR>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update1" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update2" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update3" type="text" placeholder="Enter a user ID"  value="null" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update4" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update5" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update6" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update7" type="text" placeholder="input" value="null" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update8" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update9" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update10" type="text" placeholder="input" value="null" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update11" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
			</TR>
		</TABLE>
	</div>
	<div class="w3-container w3-center w3-padding-large">
		<div class="w3-bar w3-padding-large w3-center">
    		<button class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-center" role="button" type="submit" value="Create" name="create">Add <i class="fa fa-search"></i></button>
    	</div>
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
			</tr>
			<TR>
				<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update1" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update2" type="text" placeholder="input" value="null" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update3" type="text" placeholder="input" id="myInput" style="width: 120px;">
          			</div>
          		</td>
          		<td> 
					<div class="w3-bar w3-padding-medium">
              			<input class="w3-input w3-border w3-bar-item w3-padding-small w3-card-4" name="update4" type="text" placeholder="1=admin, 0=non-admin" value="0" id="myInput" style="width: 120px;">
          			</div>
          		</td>
			</TR>
		</TABLE>
	</div>
	<div class="w3-container w3-center w3-padding-large">
		<div class="w3-bar w3-padding-large w3-center">
    		<button class="w3-button w3-green w3-bar-item w3-padding-large w3-xlarge w3-center" role="button" type="submit" value="Create" name="create">Add <i class="fa fa-search"></i></button>
    	</div>
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
		}
	%>
	</form>

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
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
        <title>CIDS: About</title>
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


	<!-- Content area -->
	<div class="w3-card-4 w3-green w3-padding-16 w3-center w3-animate-zoom">

		<header class="w3-container w3-center w3-black" style="padding-top:70px">
			<h1>About</h1>
		</header>

		<div class="w3-container">
			<pre>
				<h3>
      The Clean Infrastructure Deployment System (CIDS) is meant to help 
manage the deployment and progress towards completion of projects across the nation.
Different projects include clean power plants, public transit (high-speed rails/monorails),
Electric Vehicle charging stations, and more!

      This site is useful for the people managing these projects at different levels 
within the national, province, and local governments so they know where their 
attention needs to be for certain projects while also providing accountability 
to be certain the people assigned to projects are making good progress and
the projects are worth the time and money.
      </h3>
			</pre>
		</div>

	</div>

	<footer class="w3-container w3-padding-64 w3-center w3-xlarge w3-bottom">
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
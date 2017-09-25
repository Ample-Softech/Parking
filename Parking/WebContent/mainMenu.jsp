<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>

</head>
<body>
<nav class="navbar navbar-inverse navbar1">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/Parking/">YourParkingSpace</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">Drivers</a></li>
        <li><a href="/Parking/SpaceOwners.basic">Space Owners</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      		<li><a href="/Parking/PReg.basic"><span class="glyphicon glyphicon-map-marker"></span> Space/Land </a></li>
	      	<c:if test="${userLog=='login'}">
	    	    <li><a href="/Parking/SignOut.basic"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
 			</c:if>
      		<c:if test="${userLog!='login'}">
        		<li><a href="/Parking/LoginPage.basic"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	 		</c:if>
      </ul>	
    </div>
  </div>
</nav>
</body>
</html>
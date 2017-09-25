<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page errorPage="error.jsp" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Space Owners List</title>
	<jsp:include page="/link.jsp"></jsp:include>
	<link rel="stylesheet" href='<c:url value="https://www.w3schools.com/w3css/4/w3.css"></c:url>'  />
</head>
<body>
		<!-- MENU BAR -->
		<jsp:include page="/mainMenu.jsp"></jsp:include>

<div class="container-fluid">
<br><br>
	<div class="container-fluid jumbotron myw">
		<div class="text-center"><label style="margin-bottom: 25px;font-size: 25px;">Parking Owner</label></div>
		<table class="w3-table w3-centered w3-hoverable w3-responsive w3-card-4">
			<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>City</th>
				<th>State</th>	
				<th>Pincode</th>	
				<th>Parking's</th>		
			</tr>
			</thead>
			<tbody>
			<c:forEach var="u" items="${users }" varStatus="status">
			<tr>
				<td>${u.fname }</td>
				<td>${u.lname }</td>
				<td>${u.gender }</td>
				<td>${u.city }</td>
				<td>${u.state }</td>
				<td>${u.pincode }</td>				
				<td><a href="/Parking/ShowParkings/${u.id}.basic">SHOW</a></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>	
	</div>
	
</div>
  	<jsp:include page="/footer.jsp" />

</body>
</html>
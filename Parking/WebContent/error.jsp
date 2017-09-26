<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Error-Page</title>
	<jsp:include page="/link.jsp" />
</head>
<body class="container">
<%
  	System.out.println("Exception:- "+exception);
%>
  	<jsp:include page="/mainMenu.jsp" />

	<div class="container">
		<div class="well" style="text-align: center; font-size: 22px; margin-top: 25%; font-family: Castellar;>
			<label ">
				<u>ERROR</u>:- <%=exception.getMessage() %>
			</label>
		</div>
	</div>
	
</body>
</html>
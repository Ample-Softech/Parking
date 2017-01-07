<%@page language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<jsp:include page="/link.jsp"></jsp:include>
</head>
<body>
	
		<!-- MENU BAR -->
		<jsp:include page="/mainMenu.jsp"></jsp:include>

<div class="container">
  <h2>Login Form</h2>
  <form>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
<!--     <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div> -->
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</body>
</html>
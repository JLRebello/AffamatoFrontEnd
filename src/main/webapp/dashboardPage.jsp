<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
</head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link type="text/css" rel="stylesheet" href="about.css" />
  
<body id="dashboardbody">
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
        pageContext.setAttribute("user", user);
%>
<div class="topnav">
  <a class="active" href="dashboardPage.jsp">My Dashboard</a>
  <a href="landingPage.jsp">Home</a>
  <a href="aboutPage.jsp">About</a>
  <a style="float:right" href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log Out</a>
    <div class="search-container">
	    <form action="/action_page.php">
	      <input type="text" placeholder="Search..." name="search">
	      <button type="submit"><i class="fa fa-search"></i></button>
	    </form>
  	</div>
</div>
<div class="vertnav">
<br>
<l>
  <li><a class="active" href="dashboardPage.jsp">Welcome</a></li>
  <li><a href="inventoryPage.jsp">My Inventory</a></li>
  <li><a href="grocerylistPage.jsp">My Grocery Lists</a></li>
  <li><a href="recipesPage.jsp">My Recipes</a></li>
</l>
</div>
<div class="container" style="width: 50%; float: right">
	<div class="panel panel-danger">
	  <div class="panel-heading">Expiration Alerts!</div>
	  <div class="panel-body">List soon-to-be expiring ingredients and relevant dates here</div>
	</div>
	<div class="panel panel-info">
	  <div class="panel-heading">Tip of the Day</div>
	  <div class="panel-body">Eggs can last way past the date on the egg carton! Here's how to test if they are 
	  still good: Fill a bowl with cold water and place eggs inside. If they're a few weeks old but still good to eat, 
	  they'll stand on one end at the bottom of the bowl. If they float to the surface, they're no longer fresh enough to eat.</div>
	</div>
</div>
<%
    } else {
    	response.sendRedirect("/landingPage.jsp");
    }
%>

</body>
</html>
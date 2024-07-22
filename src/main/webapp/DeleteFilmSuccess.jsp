<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Boolean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FilmZoneAPP || MVC</title>
<script>
		window.onload = function(){
			<% if (Boolean.TRUE.equals(request.getAttribute("!FilmDeleteSuccess"))){%>
			alert("Film Successfully Deleted!");
			window.location = "/";
			%>}else if (request.getAttribute("FilmDeleteSuccess") != null){%>
				alert("Failed to delete film");
				// window.location = '/updateFilmForm';
			<%}%>
		}
	</script>
</head>
<body>	
	<style type="text/css">
  		<%@include file="css/homestyles.css" %>
  		<%@include file="css/filmmodal.css" %>
	</style>

	<div class="alert_modal_overlay">
    	<div class="alert_modal_interior">
			<div class="alert_modal_content">
		    	<h3>Successfully Deleted Film</h3>
		    	<a href="./"><button class="alert_route_btn">Go back home</button></a>
		    </div>	
		</div>
	</div>	
</body>
</html>
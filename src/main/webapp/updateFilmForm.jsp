<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Film" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FilmZone App | Edit Film</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<style type="text/css">
	  <%@include file="css/homestyles.css" %>
	  <%@include file="css/filmmodal.css" %>
	</style>
	
	<div class="modal_overlay">
    		<div class="edit_film_modal_interior">
    			<div class="modl">
	<div class="modal_header">
		    			<h3>Edit film details</h3>
		    			<a href="./"><h2><i class="fa-solid fa-xmark"></i></h2></a>
		    		</div>
	<form method="post" class="edit_film_form">
		<label>ID:</label>
		<input type="number" id="formData" value="<%= ((Film)request.getAttribute("film")).getId()%>" name="id" placeholder="Enter new film ID"/>
		<label>Title:</label>
		            	<input type="text" id="formData" value="<%= ((Film)request.getAttribute("film")).getTitle()%>" name="title" placeholder="Enter film title"/>
		            	<label>Year:</label>
		            	<input type="number" id="formData" value="<%= ((Film)request.getAttribute("film")).getYear()%>" name="year" placeholder="Enter film year"/>
		            	<label>Director:</label>
		            	<input type="text" id="formData" value="<%= ((Film)request.getAttribute("film")).getDirector()%>" name="director" placeholder="Enter film director"/>
		            	<label>Stars:</label>
		            	<input type="text" id="formData" value="<%= ((Film)request.getAttribute("film")).getStars()%>" name="stars" placeholder="Enter the stars of the film"/>
		            	<label>Review:</label>
		            	<input type="text" id="formData"  value="<%= ((Film)request.getAttribute("film")).getReview()%>" name="review" placeholder="Enter film review"/>
		            	<button type="submit" class="film_submit_btn">Submit film</button>
		        	</form>
		        	</div>
    		</div>
    	</div> 
</body>
</html>
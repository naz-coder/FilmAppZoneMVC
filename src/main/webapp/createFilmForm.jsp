<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FilmZone App | Create Film</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<style type="text/css">
  <%@include file="css/homestyles.css" %>
  <%@include file="css/filmmodal.css" %>
</style>

<div class="modal_overlay">
    		<div class="modal_interior">
    			<div class="modl">
	<div class="modal_header">
		    			<h3>Create a new film</h3>
		    			<a href="./"><h2><i class="fa-solid fa-xmark"></i></h2></a>
		    		</div>
	<form method="post" id="createForm" class="film_form">
		            	<input type="number" id="formData" name="id" placeholder="Enter new film ID"/>
		            	<input type="text" id="formData" name="title" placeholder="Enter film title"/>
		            	<input type="number" id="formData" name="year" placeholder="Enter film year"/>
		            	<input type="text" id="formData" name="director" placeholder="Enter film director"/>
		            	<input type="text" id="formData" name="stars" placeholder="Enter the stars of the film"/>
		            	<input type="text" id="formData" name="review" placeholder="Enter film review"/>
		            	<button type="submit" class="film_submit_btn">Submit film</button>
		        	</form>
</div>
    		</div>
    	</div> 
</body>
</html>
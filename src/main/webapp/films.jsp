<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%@ page import="models.Film" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FilmZone App | MVC</title>
    <link href="css/homestyles.css" rel="stylesheet" type="text/css">
    <link href="style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<style type="text/css">
  <%@include file="css/homestyles.css" %>
</style>

    <section>
    	<div class="header_container">	
    		<header>
    		<a href="./"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXLMyznwq9CdxHMgZkVLaqd5pTV-itaZcQ9qpjmIbFcw&s" alt="App Logo"></a>
    		 <div class="search_form_container">
    		 	<form action="SearchFilm" method="get" id="searchForm">
            	<input type="search" id="searchQuery" name="query" placeholder="Enter a word to search for a film"  class="search_form"/>
            	<button type="submit" class="search_submit_btn"><i class="fa-solid fa-magnifying-glass"></i></button>
        	</form>
    		 </div>
            <div class="create_film_btn_container"><a href="CreateFilm"><button class="create_film_btn">Create new film</button></a></div>
    	</header>
    	</div>    
    	
    	<!-- <div><h3>FILM LIST HERO SECTION HERE</h3></div>	 -->
    	 
    	<!-- Search film result-->
        <div>
            <div>
        	<%if(request.getParameter("query") != null){ %>
        	<div class="search_result_container">
            <h3>Search result</h3>
                <% 
                Collection<Film> searchResults = (Collection<Film>) request.getAttribute("searchResults");
                if (searchResults != null && searchResults.size() > 0) {
                	%>
                	<table>
                    <thead>
                    	<tr>
                    	<th>ID</th>
                    	<th>Title</th>
                    	<th>Year</th>
                    	<th>Director</th>
                    	<th>Stars</th>
                    	<th>Review</th>
                    	<th>Actions</th>
                    </tr>
                    </thead>
                    <%
                    for (Film film : searchResults) {
                %>
                <tr>
                <td><%= film.getId() %></td>
                <td><%= film.getTitle() %></td>
                <td><%= film.getYear() %></td>
                <td><%= film.getDirector() %></td>
                <td><%= film.getStars() %></td>
                <td><%= film.getReview() %></td>
                <td>
                	<div  class="film_actions">
                		<a href="UpdateFilm?id=<%=film.getId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                		<a href="DeleteFilm?filmIdToDelete=<%= film.getId() %>"><i class="fa-solid fa-trash-can"></i></a>
                	</div> 
                </td>
                <tr>
                <% 
                    }
                    %>
                      </table> 
                    <%
                } else {
                %>
                <em>No films found</em>
                <% 
                }
                %>
        </div>
        <%} %>
        	</div>
        	
        </div>
        
        <!-- View film -->
        <div class="film_view_container">
        <div>
            <h3>Film List</h3>
            <table>
            <thead>
            <tr>
            	<th>ID</th>
            	<th>Title</th>
            	<th>Year</th>
            	<th>Director</th>
            	<th>Stars</th>
            	<th>Review</th>
            	<th>Actions</th>
            </tr>
            </thead>
                <% 
                ArrayList<Film> allFilms = (ArrayList<Film>) request.getAttribute("allFilms");
                if (allFilms != null && allFilms.size() > 0) {
                    for (Film film : allFilms) {
                %>
                <tbody>
                	<tr>
                <td><%= film.getId() %></td>
                <td><%= film.getTitle() %></td>
                <td><%= film.getYear() %></td>
                <td><%= film.getDirector() %></td>
                <td><%= film.getStars() %></td>
                <td><%= film.getReview() %></td>
                <td>
                	<div  class="film_actions">
                		<a href="UpdateFilm?id=<%=film.getId()%>"><i class="fa-regular fa-pen-to-square"></i></a>
                		<a href="DeleteFilm?filmIdToDelete=<%= film.getId() %>"><i class="fa-solid fa-trash-can"></i></a>
                	</div> 
                </td>
            <tr>
                </tbody>
                <% 
                    }
                } 
                
                %>
            </table>
        </div>  
        </div>
        <div class="footer_container">	
    		<footer>
    			<h5>&copy;Favour Chinaza Anajemba</h5>
    			<a href="https://www.nazanajemba.com/" target="blank"><p>Visit Portfolio</p></a>
    		</footer>
    	</div>  
    </section>
    
    <script>    
    
    	const DeleteFilmHandler = (filmId) => {
    		if(confirm("Are you sure you want to delete this film?")){
    			fetch(`DeleteFilm?filmIdToDelete=${filmId}`)
    			.then(response => response.text())
    			.then(data => {
    				alert(data);
    				window.location.reload();
    			}).catch(error => console.error('Error: ', error));
    		}
    	}
    	
    	$(document).ready(function () {
            $('#filmset').DataTable();
        });
    	
    </script>
</body>
</html> 
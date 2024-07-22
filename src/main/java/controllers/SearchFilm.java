package controllers;

import java.io.IOException;
import java.util.Collection;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;


@WebServlet("/SearchFilm")
public class SearchFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FilmDAO filmDAO = new FilmDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Collection<Film> allFilms = filmDAO.getAllFilms();
		request.setAttribute("allFilms", allFilms);
		
		String searchQuery = request.getParameter("query");
		if(searchQuery != null && !searchQuery.isEmpty()) {
			Collection<Film> searchResults = filmDAO.SearchFilm(searchQuery);
			request.setAttribute("searchResults", searchResults);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/films.jsp");
		dispatcher.forward(request, response);
		
	}

}

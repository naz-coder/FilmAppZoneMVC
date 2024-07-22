package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;

@WebServlet("/CreateFilm")
public class CreateFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		int year = Integer.parseInt(request.getParameter("year"));
		String director = request.getParameter("director");
		String stars = request.getParameter("stars");
		String review = request.getParameter("review");
		
		Film newfilm = new Film(id, title, year, director, stars, review); 
		FilmDAO filmDAO = new FilmDAO();
		filmDAO.InsertFilm(newfilm);
		
		request.setAttribute("FilmCreationSuccess", true);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/CreateFilmSuccess.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("createFilmForm.jsp");
		dispatcher.forward(request, response);
	}

}

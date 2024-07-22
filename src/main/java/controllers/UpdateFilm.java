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

@WebServlet("/UpdateFilm")
public class UpdateFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id =  Integer.parseInt(request.getParameter("id"));
		 String title = request.getParameter("title");
		 int year = Integer.parseInt(request.getParameter("year"));
		 String director = request.getParameter("director"); 
		 String stars = request.getParameter("stars"); 
		 String review = request.getParameter("review");
		 
		 //Update the film in the database 
		 Film filmUpdate = new Film(id, title, year, director, stars, review); 
		 new FilmDAO().UpdateFilm(filmUpdate);
		 
		 request.setAttribute("FilmUpdateSuccess", true);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/UpdateFilmSuccess.jsp");
		 dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Film updateFilmData = new FilmDAO().getFilmByID(Integer.parseInt(id));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateFilmForm.jsp");
		request.setAttribute("film", updateFilmData);
		dispatcher.forward(request, response);
	}
}

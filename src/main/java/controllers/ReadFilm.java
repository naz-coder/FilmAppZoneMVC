package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;

@WebServlet("/")
public class ReadFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FilmDAO filmdao = new FilmDAO();
		ArrayList<Film> allFilms = filmdao.getAllFilms();
		request.setAttribute("allFilms", allFilms);
		RequestDispatcher view = request.getRequestDispatcher("films.jsp");
		view.forward(request, response);
	
	}
}

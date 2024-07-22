package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FilmDAO;
import models.Film;

@WebServlet("/DeleteFilm")
public class DeleteFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int filmIdToDelete = Integer.parseInt(request.getParameter("filmIdToDelete"));
		new FilmDAO().DeleteFilm(filmIdToDelete); 
		
		request.setAttribute("FilmDeleteSuccess", true);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/DeleteFilmSuccess.jsp");
		 dispatcher.forward(request, response);
	}
}

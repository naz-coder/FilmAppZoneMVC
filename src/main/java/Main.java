import database.FilmDAO;

import models.Film;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		// Display all films test
		FilmDAO allFilmDAO = new FilmDAO();
		ArrayList<Film> allFilms = allFilmDAO.getAllFilms();
		allFilmDAO.displayAllFilms(allFilms);
		
		// Insert test
//		Variable to store the new film that is being inserted
		Film newfilm = new Film(2001, "Coming to Youkay", 1920, "Azeez", "Sam, Lorenzo, Chima", "Nice concept"); 
		new FilmDAO().InsertFilm(newfilm);
		 		
		Film newfilm1 = new Film(2002, "Legends of the Seeker IV", 2024, "Nuhu", "Ada, King, Mike", "The best of its kind");
		new FilmDAO().InsertFilm(newfilm1);
		
		Film newfilm2 = new Film(2003, "Big Mommas", 2007, "Tyler", "Sisi, Natalya, Gommez", "Laughter filled");
		new FilmDAO().InsertFilm(newfilm2);
		
		Film newfilm3 = new Film(2004, "Love Comes Softly", 1990, "Chilaka", "Brandy, Peters, Angelica", "Romantic");
		new FilmDAO().InsertFilm(newfilm3);
		
		Film newfilm4 = new Film(2005, "Lion King", 1915, "Sheriff", "Tonia, Maxwell, Grace", "Adventurous");
		new FilmDAO().InsertFilm(newfilm4);
		
		Film newfilm5 = new Film(2006, "Hardwares but silky", 1826, "Peters", "Denisa, Nuel, Bose", "Enlightening");
		new FilmDAO().InsertFilm(newfilm5);
		
		// SearchFilm test
		String searchWord = scanner.nextLine();
		FilmDAO filmDAO = new FilmDAO();
		Collection<Film> searchResults = filmDAO.SearchFilm(searchWord);
		filmDAO.displayFilms(searchResults);
		
		// Update test 2 
		 int filmIdToUpdate = scanner.nextInt(); 
		 scanner.nextLine();
		 
		 // Retrieve the existing film data from the database based on the provided ID
		 Film currentFilm = new FilmDAO().getFilmByID(filmIdToUpdate); 
		 if(currentFilm == null) { 
			System.out.println("Film with ID " +filmIdToUpdate+" not found. Update aborted."); 
		 	return; 
		 }
		 String title = scanner.nextLine(); 
		 int year = scanner.nextInt();
		 scanner.nextLine(); 
		 String director = scanner.nextLine();
		 String stars = scanner.nextLine();
		 String review = scanner.nextLine();
		 
		 //Update the film in the database 
		 Film filmUpdate = new Film(filmIdToUpdate, title, year, director, stars, review); new FilmDAO().UpdateFilm(filmUpdate);
		 
		// Delete test
			int filmIdToDelete = 00000000;
			new FilmDAO().DeleteFilm(filmIdToDelete);
		
	}

}

    	const ToggleFormVisibility = () => {
    		var FilmForm = document.getElementById("createFilmForm");
    		if(FilmForm.style.display === "none"){
    			FilmForm.style.display = "block";
    		}else{
    			FilmForm.style.display = "none";
    		}
    	}
    	
    	const CancelFilmCreation = () => {
    		var FilmForm = document.getElementById("createFilmForm");
    		FilmForm.style.display = "none";
    		document.getElementById("createForm").reset();
    	}
    	
    	const SubmitForm = () => {
    		const form = document.getElementById("createForm");
    		const formData = new FormData(form);
    		
    		fetch(form.action, {
    			method: 'POST',
    			body: formData
    		}).then(response => {
    			if(!response.ok){
    				throw new Error("Failed to submit form");
    			}
    			return response.json();
    		}).then(data => {
    			console.log("Form submission success: ", data);
    			CancelFilmCreation();
    		}).catch(error => {
    			console.error("Form submission error: ", error);
    		});
    	}
    	
    	const EditFilmHandler = (film) => {
    		// Fetch film data based on the filmId

				var filmData = {
    				id: film.id,
    				title: film.title,
                    year: film.year,
                    director: film.director,
                    stars: film.stars,
                    review: film.review
    		}
    		
			/*fetch(${filmId})*/
			fetch($filmId)
            .then(response => response.json())
            .then(filmData => {
                document.getElementById('formId').value = filmData.id;
                document.getElementById('formTitle').value = filmData.title;
                document.getElementById('formYear').value = filmData.year;
                document.getElementById('formDirector').value = filmData.director;
                document.getElementById('formStars').value = filmData.stars;
                document.getElementById('formReview').value = filmData.review;
                document.getElementById('editForm').style.display = 'block';
            })
            .catch(error => {
                console.error('Error fetching film data:', error);
            });



    		/* Display edith form */
    		document.getElementById('editForm').style.display = 'block';
    	}
    	
    	const SubmitEditForm = () => {
    		var from = document.getElementById('filmEditForm');
    		
			//**** changes made here
    		var formData = {
    				id: document.getElementById('formId').value,
    	    		title: document.getElementById('formTitle').value,
    	    		year: document.getElementById('formYear').value,
    	    		director: document.getElementById('formDirector').value,
    	    		stars: document.getElementById('formStars').value,
    	    		review: document.getElementById('formReview').value
    		};
    		console.log("Submitting film update: ", formData);
		
			fetch('url to update film', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            console.log('Film update successful:', data);
     
		})
        .catch(error => {
            console.error('Error updating film:', error);
        })
        .finally(() => {
            document.getElementById('editForm').style.display = 'none';
        });
		
		}
    	
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
    	
    
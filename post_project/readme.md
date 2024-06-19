# Project post of movies
This Django project consumes the OMDB API to get information about movies, groups the data by year and actor, and returns a JSON with the total count of movies by year and actor.


### Installation

1. Clone the repository or download the source code.
2. Navigate to the project directory:
    cd test_project
### Running the Application

To run the application, use the following command:
python manage.py migrate
python manage.py runserver
Open your browser and visit http://127.0.0.1:8000/movies/grouped/

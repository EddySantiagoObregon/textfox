from django.shortcuts import render
from django.http import JsonResponse
import requests
import json

OMDB_API_URL = "http://www.omdbapi.com/"
OMDB_API_KEY = "2bfe4400"  

def get_movies_data():
    movies_data = []
    for page in range(1, 101):  
        response = requests.get(OMDB_API_URL, params={'apikey': OMDB_API_KEY, 's': 'movie', 'type': 'movie', 'page': page})
        if response.status_code == 200:
            data = response.json()
            if data['Response'] == 'True':
                movies_data.extend(data['Search'])
            else:
                break
        else:
            break
    return movies_data

def group_by_year_and_actor(request):
    movies_data = get_movies_data()
    grouped_data = {}

    for movie in movies_data:
        movie_details = requests.get(OMDB_API_URL, params={'apikey': OMDB_API_KEY, 'i': movie['imdbID']}).json()
        year = movie_details.get('Year')
        actors = movie_details.get('Actors', "").split(', ')
        
        if year not in grouped_data:
            grouped_data[year] = {}
        
        for actor in actors:
            if actor not in grouped_data[year]:
                grouped_data[year][actor] = 0
            grouped_data[year][actor] += 1

    return JsonResponse(grouped_data)
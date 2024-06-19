from django.urls import path
from .views import group_by_year_and_actor

urlpatterns = [
    path('grouped/', group_by_year_and_actor, name='group_by_year_and_actor'),
]

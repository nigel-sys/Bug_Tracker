from django import views
from django.urls import path
from . import views

app_name = "home"

urlpatterns = [
    path('', views.BugsListView.as_view(), name='list'),
    path("add-bug/", views.BugCreateView.as_view(), name="add"),
]

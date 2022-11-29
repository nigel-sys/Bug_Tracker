from django import views
from django.urls import path
from . import views

app_name = "home"

urlpatterns = [
    path('', views.BugsListView.as_view(), name='list'),
    path("report-bug/", views.BugCreateView.as_view(), name="add"),
    path("edit-report/<uuid:pk>", views.BugEditView.as_view(), name="edit"),
    path("delete-report/<uuid:pk>", views.BugDeleteView.as_view())
]

from django.shortcuts import render
from django.views.generic import ListView
from .models import Bug

# Create your views here.


class BugsListView(ListView):
    model = Bug
    context_object_name = "Bugs_list"

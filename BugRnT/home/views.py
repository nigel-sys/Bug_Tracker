from django.shortcuts import render
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .models import Bug
from django.urls import reverse_lazy

# Create your views here.

class BugsListView(ListView):
    model = Bug
    context_object_name = "Bugs_list"

class BugCreateView(CreateView):
    model = Bug
    fields = "__all__"
    success_url = reverse_lazy("home:list")

class BugEditView(UpdateView):
    model = Bug
    fields = "__all__"
    success_url = reverse_lazy("home:list")

class BugDeleteView(DeleteView):
    model = Bug
    success_url = reverse_lazy("home:list")

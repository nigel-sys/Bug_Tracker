#!/bin/bash
python3 manage.py makemigrations
python3 manage.py migrate
echo "migrations performed"
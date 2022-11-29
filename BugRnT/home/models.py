from django.db import models
import uuid
from django.urls import reverse

# Create your models here.


class Bug(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.CharField(max_length=50)
    desc = models.TextField()

    PRIORITY_CHOICES = (
        ('Low', 'Low'),
        ('Medium', 'Medium'),
        ('High', 'High')
    )

    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES)

    STATUS_CHOICES = (('Open', 'Open'),
                      ('Work in Progress', 'Work in Progress'),
                      ('Fixed', 'Fixed'))

    status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default='Open')

    def __str__(self):
        return f'{self.id} ({self.name})'

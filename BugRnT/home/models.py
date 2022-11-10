from django.db import models
import uuid

# Create your models here.


class Bug(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.CharField(max_length=50)
    desc = models.TextField()

    PRIORITY_CHOICES = (
        ('l', 'Low'),
        ('m', 'Medium'),
        ('h', 'High')
    )

    priority = models.CharField(max_length=1, choices=PRIORITY_CHOICES)

    STATUS_CHOICES = (('o', 'Open'),
                      ('w', 'Work in Progress'),
                      ('f', 'Fixed'))

    status = models.CharField(
        max_length=1, choices=STATUS_CHOICES, default='o')

    def __str__(self):
        return f'{self.id} ({self.name})'

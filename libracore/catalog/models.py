from django.db import models

class Book(models.Model):
    isbn = models.CharField(max_length=13, unique=True)
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    publication_year = models.PositiveIntegerField()
    genre = models.CharField(max_length=100)
    availability = models.BooleanField(default=True)

    def __str__(self):
        return self.title

class Magazine(models.Model):
    title = models.CharField(max_length=255)
    issue_number = models.PositiveIntegerField()
    publication_date = models.DateField()
    availability = models.BooleanField(default=True)

    def __str__(self):
        return self.title

class DigitalMedia(models.Model):
    title = models.CharField(max_length=255)
    creator = models.CharField(max_length=255)
    format = models.CharField(max_length=50)
    availability = models.BooleanField(default=True)

    def __str__(self):
        return self.title
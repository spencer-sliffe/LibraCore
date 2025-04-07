from django.db import models

class Item(models.Model):
    ITEM_TYPE_CHOICES = [
        ('book', 'Book'),
        ('magazine', 'Magazine'),
        ('digital', 'Digital Media'),
    ]
    item_type = models.CharField(max_length=20, choices=ITEM_TYPE_CHOICES)
    isbn = models.CharField(max_length=13, blank=True, null=True, unique=True)
    issue_number = models.PositiveIntegerField(blank=True, null=True)
    publication_date = models.DateField(blank=True, null=True)
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255, blank=True, null=True)
    publication_year = models.PositiveIntegerField(blank=True, null=True)
    genre = models.CharField(max_length=100, blank=True, null=True)
    creator = models.CharField(max_length=255, blank=True, null=True)
    item_format = models.CharField(max_length=50, blank=True, null=True)
    availability = models.BooleanField(default=True)

    def __str__(self):
        return self.title
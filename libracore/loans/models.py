from django.db import models
from django.conf import settings

from catalog.models import Item


class BorrowingTransaction(models.Model):
    member = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    borrow_date = models.DateField()
    due_date = models.DateField()
    return_date = models.DateField(null=True, blank=True)
    fine = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    reservation = models.OneToOneField('Reservation', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"Transaction {self.pk} by {self.member}"

class Reservation(models.Model):
    member = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    request_date = models.DateField(auto_now_add=True)
    status = models.CharField(max_length=20, default='pending')

    def __str__(self):
        return f"Reservation {self.pk} by {self.member}"
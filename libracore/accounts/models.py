from django.contrib.auth.models import AbstractUser, Group, Permission
from django.db import models

class User(AbstractUser):
    ROLE_CHOICES = [
        ('member', 'Member'),
        ('staff', 'Staff'),
        ('admin', 'Administrator'),
    ]
    MEMBERSHIP_CHOICES = [
        ('basic', 'Basic'),
        ('premium', 'Premium'),
        ('none', 'None'),
    ]
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='member')
    membership_type = models.CharField(max_length=20, choices=MEMBERSHIP_CHOICES, blank=True, null=True)
    account_status = models.CharField(max_length=20, default='active')
    contact_info = models.CharField(max_length=255, blank=True)
    groups = models.ManyToManyField(
        Group,
        related_name="custom_user_set",
        blank=True,
        verbose_name="groups",
        help_text="The groups this user belongs to."
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name="custom_user_permissions_set",
        blank=True,
        verbose_name="user permissions",
        help_text="Specific permissions for this user."
    )
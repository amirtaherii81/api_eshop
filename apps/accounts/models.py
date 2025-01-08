from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, AbstractUser
from django.utils.translation import gettext_lazy as _
from django.db import models

import random

# Create your models here.
class CustomUserManager(BaseUserManager):
    def create_user(self, mobile_number, first_name='', last_name='', email='', active_code=None, gender=None,  password=None,):
        if not mobile_number:
            # TODO: translate
            raise ValueError("Enter the mobile number")

        user = self.model(
            mobile_number=mobile_number,
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            gender=gender,
            active_code=random.randint(1000, 9999),
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, mobile_number, email, first_name, last_name, password=None, active_code=None, gender=None):
        user = self.create_user(
            mobile_number=mobile_number,
            email=email,
            first_name=first_name,
            last_name=last_name,
            active_code=active_code,
            gender=gender,
            password=password,
        )
        user.is_active = True
        user.is_admin = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class CustomUser(AbstractBaseUser, PermissionsMixin):
    mobile_number = models.CharField(_('mobile number'), max_length=11, unique=True)
    first_name = models.CharField(_('first name'), max_length=50, blank=True)
    last_name = models.CharField(_('last name'), max_length=50, blank=True)
    email = models.EmailField(_('email address'), blank=True)
    GENDER_CHOICES = (('True', 'man'), ('False', 'woman'))
    gender = models.CharField(_('gender') ,max_length=50, choices=GENDER_CHOICES, blank=True, null=True)
    register_date = models.DateTimeField(_('date registered'), auto_now_add=True)
    is_active = models.BooleanField(_('is active'), default=False)
    is_admin = models.BooleanField(_('is admin'), default=False)
    active_code = models.CharField(_('active code'), max_length=100, null=True, blank=True)

    USERNAME_FIELD = 'mobile_number'
    REQUIRED_FIELDS = ['email', 'first_name', 'last_name']

    objects = CustomUserManager()

    def __str__(self):
        return self.mobile_number

    @property
    def is_staff(self):
        return self.is_admin

    class Meta:
        db_table = 'custom_user'
        verbose_name = _('user')
        verbose_name_plural = _('users')
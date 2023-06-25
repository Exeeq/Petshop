from django.db import models
from django.contrib.auth.models import AbstractUser
from core.models import *

# Create your models here.

class UsuarioCustom(AbstractUser):
    suscriptor = models.BooleanField(default=False)
    

    def __str__(self):
        return self.username
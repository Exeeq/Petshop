from django.db import models
from django.contrib.auth.models import User
from django.conf import settings


# Create your models here.


class TipoProducto(models.Model):
    descripcion = models.CharField(max_length=50)

    def __str__(self):
        return self.descripcion

class Producto(models.Model):
    nombre = models.CharField(max_length=50)
    precio = models.IntegerField()
    stock = models.IntegerField()
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)
    descripcion = models.CharField(max_length=250)
    vencimiento = models.DateField()
    imagen = models.ImageField(null=True,blank=True)

    def __str__(self):
        return self.nombre
    
    def calcularDescuento(self):
        return round(self.precio - (self.precio * 0.05))
    
class Empleado(models.Model):
    nombre_empleado = models.CharField(max_length=80)
    cargo = models.CharField(max_length=250)
    descripcion_empleado = models.CharField(max_length=250)
    imagen_empleado = models.ImageField(null=True,blank=True)
    
    def __str__(self):
        return self.nombre_empleado

class Carrito(models.Model):
    usuario = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    productos = models.ManyToManyField(Producto, through='ItemCarrito')

    def __str__(self):
        return f"Carrito de {self.usuario.username}"

class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def __str__(self):
        return self.producto.nombre, self.carrito.usuario.username


from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
import uuid


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

    def disminuir_stock(self, cantidad):
        self.stock -= cantidad
        self.save()
    
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
        return f"{self.usuario.username}"
    
    
class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.producto.nombre} - {self.carrito.usuario.username}"

    def precio_total(self):
        return self.cantidad * self.producto.precio
    
    def calcularDescuentoCarrito(self):
        return round(self.producto.precio - (self.producto.precio * 0.05))
    
    def precio_total_suscritor(self):
        return round(self.producto.precio - (self.producto.precio * 0.05)) * self.cantidad
    
class Seguimiento(models.Model):
    descripcion = models.CharField(max_length=250)

    def __str__(self):
        return self.descripcion
 
class Orden(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    numero = models.CharField(max_length=36, unique=True, default=uuid.uuid4)
    fecha = models.DateTimeField(auto_now_add=True)
    estado = models.ForeignKey(Seguimiento, on_delete=models.CASCADE, default=1)


    def __str__(self):
        return f"Orden #{self.numero}"
    



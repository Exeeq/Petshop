from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, user_passes_test
import time
from rest_framework import viewsets
from .serializers import *
import requests

# FUNCIÓN GENERICA QUE VALIDA EL GRUPO
def grupo_requerido(nombre_grupo):
     def decorator(view_func):
          @user_passes_test(lambda user: user.groups.filter(name=nombre_grupo).exists())
          def wrapper(requests, *args, **kwargs):
               return view_func(requests, *args, **kwargs)
          return wrapper
     return decorator

# CREANDO UNA CLASE QUE VA A PERMITIR LA TRANSFORMACIÓN
class ProductoViewset(viewsets.ModelViewSet):
     queryset = Producto.objects.all()
     serializer_class = ProductoSerializers

class TipoProductoViewset(viewsets.ModelViewSet):
     queryset = TipoProducto.objects.all()
     serializer_class = TipoProductoSerializers


def index(request):
	return render(request, 'core/index.html')


def about(request):
    empleado = Empleado.objects.all()
        
    data2 = {
        'listado2': empleado,
    }

    return render(request, 'core/about.html', data2)

@login_required
def cart(request):
    return render(request, 'core/cart.html')

@login_required
def checkout(request):
	return render(request, 'core/checkout.html')

def contact_us(request):
	return render(request, 'core/contact-us.html')

@login_required
def my_account(request):
	return render(request, 'core/my-account.html')


@login_required
def shop(request):
    productos = Producto.objects.all()

    paginator = Paginator(productos, 3)  # Especifica cuántos elementos quieres mostrar por página

    page = request.GET.get('page', 1)
    productos = paginator.get_page(page)

    data = {
        'listado': productos,
        'paginator': paginator
    }

    return render(request, 'core/shop.html', data)

def shopapi(request):
    respuesta = requests.get('http://127.0.0.1:8000/api/productos/')
    respuesta2 = requests.get('https://mindicador.cl/api/')
    respuesta3 = requests.get('https://rickandmortyapi.com/api/character')


    datita = respuesta.json()
    datita2 = respuesta2.json()
    aux = respuesta3.json()
    personajes = aux['results']

    data = {
        'listado': datita,
        'moneda' : datita2,
        'personajes' : personajes,
    }

    return render(request, 'core/shopapi.html', data)



#@grupo_requerido('vendedor')
@login_required
def seguimiento(request):
	return render(request, 'core/seguimiento.html')

@login_required
def mapa(request):
	return render(request, 'core/mapa.html')

@login_required
def suscripcion(request):
    return render(request, 'core/suscripcion.html')


#CRUD
def add(request):
    data = {
        'form' : ProductoForm()
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            data['msj'] = "Producto almacenado correctamente"
            messages.success(request, "Producto almacenado correctamente")

    return render(request, 'core/add-product.html', data)


def update(request,id):
    producto = Producto.objects.get(id=id) 
    data = {
        'form' : ProductoForm(instance=producto)
    }

    if request.method == 'POST':

        formulario = ProductoForm(data=request.POST, instance=producto, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            messages.success(request, "Producto modificado correctamente")
            data['form'] = formulario
	     

    return render(request, 'core/update-product.html', data)

    

def delete(request,id):
    producto = Producto.objects.get(id=id) 
    producto.delete()

    return redirect(to="shop")


# CRUD EMPLEADO (A ELECCIÓN)

def addEmpleado(request):
    data2 = {
        'form' : EmpleadoForm()
    }

    if request.method == 'POST':
        formulario = EmpleadoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            data2['msj'] = "Empleado almacenado correctamente"
            messages.success(request, "Empleado almacenado correctamente")

    return render(request, 'core/add-empleado.html', data2)


def updateEmpleado(request,id):
    empleado = Empleado.objects.get(id=id) 
    data2 = {
        'form' : EmpleadoForm(instance=empleado)
    }

    if request.method == 'POST':

        formulario = EmpleadoForm(data=request.POST, instance=empleado, files=request.FILES)
        if formulario.is_valid():
            formulario.save() 
            messages.success(request, "Empleado modificado correctamente")
            data2['form'] = formulario
	     

    return render(request, 'core/update-empleado.html', data2)

    

def deleteEmpleado(request,id):
    empleado = Empleado.objects.get(id=id) 
    empleado.delete()

    return redirect(to="about")

#REGISTRO DE USUARIOS
def register(request):
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
             form.save()
             return redirect("index")
    return render(request, 'registration/register.html', { 'form': form })





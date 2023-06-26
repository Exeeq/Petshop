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
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import uuid
from django.core.exceptions import ObjectDoesNotExist


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


class EmpleadoViewset(viewsets.ModelViewSet):
     queryset = Empleado.objects.all()
     serializer_class = EmpleadoSerializers

class CarritoViewset(viewsets.ModelViewSet):
     queryset = Carrito.objects.all()
     serializer_class = CarritoSerializers

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
    usuario = request.user
    carrito = Carrito.objects.get(usuario=usuario)
    items = carrito.itemcarrito_set.all()
    precio_total = 0
    precio_total_dolares = 0
    respuesta = requests.get('https://mindicador.cl/api/')

    
    monedas = respuesta.json()
    tasa_dolar = monedas['dolar']['valor']

    for item in items:
        if usuario.suscriptor:
            precio_total += item.precio_total_suscritor()
            precio_total_dolares = round(precio_total / tasa_dolar, 2)
        else:
            precio_total += item.precio_total()
            precio_total_dolares = round(precio_total / tasa_dolar, 2)

    data3 = {
        'carrito': carrito,
        'precio_total': precio_total,
        'precio_total_dolares': precio_total_dolares
    }
    
    return render(request, 'core/cart.html', data3)

@login_required
def checkout(request):
	return render(request, 'core/checkout.html')

def contact_us(request):
	return render(request, 'core/contact-us.html')

@login_required
def admin(request):
    ordenes = Orden.objects.all()
    form = EstadoOrden()

    if request.method == 'POST':
        form = EstadoOrden(request.POST)
        if form.is_valid():
            orden_numero = form.cleaned_data['orden_numero']
            estado = form.cleaned_data['estado']
            orden = Orden.objects.get(numero=orden_numero)
            orden.estado = estado
            orden.save()

    data = {
        'ordenes': ordenes,
        'form': form,
    }

    return render(request, 'core/admin_vista.html', data)

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
    form = SeguimientoForm()
    data1 = {
        'form': form
    }
    if request.method == 'POST':
        form = SeguimientoForm(request.POST)
        if form.is_valid():
            numero_orden = form.cleaned_data['numero_orden']
            try:
                orden = Orden.objects.get(numero=numero_orden)
                data1['orden'] = orden
                print(orden.numero)
                return render(request, 'core/mapa.html', data1)
            except ObjectDoesNotExist:
                messages.error(request, "¡EL NÚMERO DE ORDEN NO EXISTE!")

    return render(request, 'core/seguimiento.html', data1)

@login_required
def mapa(request, numero_orden):
    orden = Orden.objects.get(numero=numero_orden)
    return render(request, 'mapa.html', {'numero_orden': orden})

@login_required
def suscripcion(request):
    return render(request, 'core/suscripcion.html')

@login_required
def historial_compras(request):
    usuario = request.user
    ordenes = Orden.objects.filter(carrito__usuario=usuario)
    items = []

    for orden in ordenes:
        carrito = orden.carrito
        items_carrito = ItemCarrito.objects.filter(carrito=carrito)
        for item in items_carrito:
            ItemOrden.objects.create(orden=orden, producto=item.producto, cantidad=item.cantidad)


    data = {
        'historial': ordenes,
        'items': items,
    }
    return render(request, 'core/historial_compras.html', data)

def boleta(request, numero_orden):
    usuario = request.user
    orden = Orden.objects.get(numero = numero_orden)
    carrito = Carrito.objects.get(usuario=usuario)
    items = carrito.itemcarrito_set.all()

    data = {
         'orden': orden,
         'carrito': carrito,
         'items': items,
    }

    return render(request, 'core/boleta.html', data)

@login_required
def actualizar_suscriptor(request):
    usuario = request.user
    usuario.suscriptor = True
    usuario.save()

    return render(request, 'core/suscripcion.html')

@login_required
def desuscribirse(request):
    usuario = request.user
    usuario.suscriptor = False
    usuario.save()

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

#CRUD CARRITO

def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, pk=producto_id)
    carrito, created = Carrito.objects.get_or_create(usuario=request.user)
    item, item_created = ItemCarrito.objects.get_or_create(carrito=carrito, producto=producto)
    if not item_created:
        item.cantidad += 1
        item.save()

    producto.disminuir_stock(1)

    return redirect(to="shop")

def eliminar_del_carrito(request, itemcarrito_id):
    item = get_object_or_404(ItemCarrito, pk=itemcarrito_id, carrito__usuario=request.user)

    # Obtener el producto asociado al ítem eliminado
    producto = item.producto

    # Incrementar la cantidad disponible en el stock del producto
    producto.stock += item.cantidad

    # Guardar los cambios en el producto
    producto.save()

    # Eliminar el ítem del carrito
    item.delete()

    return redirect(to="cart")

#REGISTRO DE USUARIOS
def register(request):
    form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
             form.save()
             return redirect("index")
    return render(request, 'registration/register.html', { 'form': form })

#ORDEN DE COMPRA

def crear_orden(request):
    if request.method == 'POST':
        usuario = request.user
        carrito = usuario.carrito

        # Crear la instancia de la orden
        orden = Orden.objects.create(carrito=carrito, numero=str(uuid.uuid4()))

        # Obtener los items del carrito
        items_carrito = carrito.itemcarrito_set.all()

        # Crear instancias de ItemOrden y asignarlos a la orden
        for item in items_carrito:
            ItemOrden.objects.create(orden=orden, producto=item.producto, cantidad=item.cantidad)

        # Limpiar el carrito
        carrito.productos.clear()

        # Devolver una respuesta JSON indicando el éxito de la creación de la orden
        return JsonResponse({'success': True, 'numero_orden': orden.numero})
    else:
        return JsonResponse({'success': False})


def cambiar_estado(request, numero_orden):
    orden = Orden.objects.get(numero=numero_orden)
    form = EstadoOrden(request.POST or None, initial={'estado': orden.estado})

    if request.method == 'POST' and form.is_valid():
        seguimiento = Seguimiento.objects.create(descripcion=form.cleaned_data['estado'])
        orden.estado = seguimiento
        orden.save()
        # Realizar cualquier acción adicional después de actualizar el estado

    data = {
        'ordenes': Orden.objects.all(),
        'form': form,
    }

    return render(request, 'core/admin_vista.html', data)


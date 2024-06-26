from django.urls import path, include
from .views import *
from rest_framework import routers

# CREAMOS LAS RUTAS PARA LA API
router = routers.DefaultRouter()
router.register('productos', ProductoViewset)
router.register('tipoproductos', TipoProductoViewset)
router.register('empleado', EmpleadoViewset)
router.register('carrito', CarritoViewset)


urlpatterns = [
    # API
    path('api/', include(router.urls)),

    path('', index, name="index"),
	path('about/',about, name="about"),
    path('cart/',cart, name="cart"),
    path('checkout/',checkout, name="checkout"),
    path('contact-us/',contact_us, name="contact-us"),
    path('shop/',shop, name="shop"),
    path('shopapi/',shopapi, name="shopapi"),
    path('seguimiento/',seguimiento, name="seguimiento"),
    path('mapa/', mapa, name='mapa'),
    path('suscripcion/', suscripcion, name="suscripcion"),
    path('historial_compras/', historial_compras, name="historial_compras"),

   #CRUD SHOP
    path('add/', add, name="add"),
    path('update/<id>/', update, name="update"),
    path('delete/<id>/', delete, name="delete"),

    #CRUD ABOUT
    path('addEmpleado/', addEmpleado, name="addEmpleado"),
    path('updateEmpleado/<id>/', updateEmpleado, name="updateEmpleado"),
    path('deleteEmpleado/<id>/', deleteEmpleado, name="deleteEmpleado"),

    #CRUD CARRITO
    path('agregar/<producto_id>/', agregar_al_carrito, name='agregar_al_carrito'),
    path('eliminar_del_carrito/<itemcarrito_id>/', eliminar_del_carrito, name='eliminar_del_carrito'),

    #REGISTRO DE USUARIOS
    path('register/', register, name="register"),

    #SUSCRIPCIÓN
    path('actualizar_suscriptor/', actualizar_suscriptor, name='actualizar_suscriptor'),
    path('desuscribirse/', desuscribirse, name='desuscribirse'),

    #ADMIN
    path('admin_vista/', admin, name="admin"),

    #ORDEN
    path('crear_orden/', crear_orden, name='crear_orden'),
    path('boleta/<numero_orden>', boleta, name='boleta'),
    path('cambiar_estado/<str:numero_orden>/', cambiar_estado, name='cambiar_estado'),

    #CRUD TIPO PRODUCTO
    path('add_tipoproducto/', addTipoProducto, name="addTipoProducto"),
    

]	



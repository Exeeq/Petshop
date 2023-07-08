from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from usuario.models import *

# CREAMOS UN TEMPLATE DE UN FORMULARIO EN BASE AL MODELO
class ProductoForm(ModelForm):
    nombre = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    precio = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Precio"}))   
    stock = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Stock"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))

    class Meta:
        model = Producto
        fields = '__all__'
    
        widgets = {
            'vencimiento' : forms.SelectDateWidget(years=range(2023,2061))
        }

class EmpleadoForm(ModelForm):
    nombre_empleado = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    cargo = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese cargo"}))

    class Meta:
        model = Empleado
        fields = '__all__'

class LoginForm(forms.Form):
    username = forms.CharField(max_length=65)
    password = forms.CharField(max_length=65, widget=forms.PasswordInput)


class RegisterForm(UserCreationForm):
    class Meta:
        model=UsuarioCustom
        fields = ['username','email','password1','password2']

class SeguimientoForm(forms.Form):
    numero_orden = forms.CharField(max_length=100, widget=forms.TextInput(attrs={"placeholder":"INGRESE NÚMERO DE ORDEN"}))
    numero_orden.widget.attrs['class'] = 'text-center'
    numero_orden.label = ''

ESTADOS_ORDEN = [
    ('SOLICITUD INGRESADA', 'SOLICITUD INGRESADA'),
    ('EN PREPARACIÓN', 'EN PREPARACIÓN'),
    ('EN RUTA', 'EN RUTA'),
    ('ENTREGADO', 'ENTREGADO'),
    ]

class EstadoOrden(forms.Form):
    estado = forms.ChoiceField(label='Estado', choices=ESTADOS_ORDEN)

class SuscripcionForm(forms.Form):
    monto = forms.IntegerField(min_value=5,widget=forms.NumberInput(attrs={"placeholder":"Ingrese monto"}))   




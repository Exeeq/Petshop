# Generated by Django 3.1.2 on 2023-06-24 22:47

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orden',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.CharField(default=uuid.uuid4, max_length=36, unique=True)),
                ('fecha', models.DateTimeField(auto_now_add=True)),
                ('carrito', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='core.carrito')),
            ],
        ),
    ]
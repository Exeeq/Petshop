# Generated by Django 3.1.2 on 2023-06-25 03:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('usuario', '0002_usuariocustom_direccion'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usuariocustom',
            old_name='direccion',
            new_name='direccion_casa',
        ),
    ]

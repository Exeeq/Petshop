# Generated by Django 3.1.2 on 2023-06-12 19:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Empleado',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('v_nombre_empleado', models.CharField(max_length=80)),
                ('v_cargo', models.CharField(max_length=250)),
                ('v_descripcion', models.CharField(max_length=250)),
                ('v_imagen', models.ImageField(blank=True, null=True, upload_to='')),
            ],
        ),
    ]

# Generated by Django 3.1.2 on 2023-06-25 04:04

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_seguimiento'),
    ]

    operations = [
        migrations.AddField(
            model_name='orden',
            name='Item',
            field=models.OneToOneField(default=django.utils.timezone.now, on_delete=django.db.models.deletion.CASCADE, to='core.itemcarrito'),
            preserve_default=False,
        ),
    ]
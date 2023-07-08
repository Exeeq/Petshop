# Generated by Django 3.1.2 on 2023-06-25 23:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_delete_itemorden'),
    ]

    operations = [
        migrations.CreateModel(
            name='ItemOrden',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.PositiveIntegerField(default=1)),
                ('orden', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.orden')),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.producto')),
            ],
        ),
        migrations.AddField(
            model_name='orden',
            name='productos',
            field=models.ManyToManyField(null=True, through='core.ItemOrden', to='core.Producto'),
        ),
    ]
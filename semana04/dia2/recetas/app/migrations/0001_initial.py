# Generated by Django 4.0.6 on 2022-07-06 01:27

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Receta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=100)),
                ('ingredientes', models.TextField(help_text='Ingresa los ingredientes')),
                ('preparacion', models.TextField(help_text='Ingresa los pasos de preparacion')),
                ('tiempo_registro', models.DateTimeField(auto_now=True)),
                ('autor', models.CharField(max_length=200)),
            ],
        ),
    ]

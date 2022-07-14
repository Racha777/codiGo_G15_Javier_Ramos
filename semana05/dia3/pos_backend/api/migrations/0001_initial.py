# Generated by Django 3.2 on 2022-07-14 01:21

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Mesa',
            fields=[
                ('mesa_id', models.AutoField(primary_key=True, serialize=False)),
                ('mesa_nro', models.CharField(max_length=10, verbose_name='Nro Mesa')),
                ('mesa_cap', models.IntegerField(default=0, verbose_name='Capacidad')),
            ],
            options={
                'db_table': 'tbl_mesa',
            },
        ),
    ]

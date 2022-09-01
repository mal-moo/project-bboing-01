# Generated by Django 4.0.6 on 2022-08-25 15:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cafe',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=165)),
                ('name_en', models.CharField(max_length=300)),
                ('phone', models.CharField(blank=True, max_length=12, null=True)),
                ('hours', models.JSONField(default=dict, null=True)),
                ('sns', models.JSONField(default=dict, null=True)),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('update_date', models.DateTimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_url', models.CharField(max_length=2000)),
                ('name', models.CharField(max_length=40)),
                ('price', models.IntegerField(default=0, null=True)),
                ('update_date', models.DateTimeField(null=True)),
                ('cafe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menu', to='cafe.cafe')),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('latitude', models.DecimalField(decimal_places=6, max_digits=9)),
                ('longtitude', models.DecimalField(decimal_places=6, max_digits=9)),
                ('sido', models.CharField(max_length=40)),
                ('sigungu', models.CharField(max_length=40)),
                ('doro', models.CharField(max_length=40)),
                ('doro_code', models.CharField(max_length=80)),
                ('sangse', models.CharField(max_length=165, null=True)),
                ('update_date', models.DateTimeField(null=True)),
                ('cafe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='address', to='cafe.cafe')),
            ],
        ),
    ]
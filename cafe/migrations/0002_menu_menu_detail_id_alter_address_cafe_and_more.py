# Generated by Django 4.0.6 on 2022-08-25 15:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cafe', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='menu_detail_id',
            field=models.IntegerField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='address',
            name='cafe',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='address', to='cafe.cafe'),
        ),
        migrations.AlterField(
            model_name='menu',
            name='cafe',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='menu', to='cafe.cafe'),
        ),
    ]
from django.db import models
from .validators import *

class Cafe(models.Model):
    name = models.CharField(max_length=165, validators=[validate_korean_digit()])
    name_en = models.CharField(max_length=300, validators=[validate_slug])
    phone = models.CharField(max_length=12, null=True, blank=True, validators=[])
    hours = models.JSONField(default=dict, null=True, validators=[])
    sns = models.JSONField(default=dict, null=True, validators=[])
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(null=True)

    class Meta:
        """
        제약사항:
            1. 중복된 name은 없어야한다.
        """
        constraints = [
            models.UniqueConstraint(fields=['name'], name='unique_name'),
        ]

class Address(models.Model):
    latitude = models.DecimalField(max_digits=9, decimal_places=6, validators=[validate_decimal(6, 9)])
    longtitude = models.DecimalField(max_digits=9, decimal_places=6, validators=[validate_decimal(6, 9)])
    sido = models.CharField(max_length=40, validators=[validate_korean()])
    sigungu = models.CharField(max_length=40, validators=[validate_korean()])
    doro = models.CharField(max_length=40, validators=[validate_korean()])
    doro_code = models.CharField(max_length=80, validators=[])
    sangse = models.CharField(max_length=165, null=True, validators=[validate_korean_digit()])
    update_date = models.DateTimeField(null=True, auto_now_add=True)
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='address',null=True, blank=True)

    class Meta:
        """
        제약사항:
            1. 중복된 (latitude, longtitude) 없어야한다.
        """
        constraints = [
            models.UniqueConstraint(fields=['latitude', 'longtitude', 'cafe'], name='unique_latitude_longtitude_cafe'),
        ]

class Menu(models.Model):
    image_url = models.CharField(max_length=2000, validators=[validate_URL()])
    name = models.CharField(max_length=40, validators=[validate_korean_unicode_digit()])
    price = models.IntegerField(default=0, null=True, validators=[validate_korean_unicode_digit()])
    update_date = models.DateTimeField(null=True, auto_now_add=True)
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='menu',null=True, blank=True)

    class Meta:
        """
        제약사항:
            1. cafe_id가 같은 경우, 중복된 name은 없어야한다.
            2. image_url이 cafe_id당 1개만 있으면 되지않을까?
        """
        constraints = [
             models.UniqueConstraint(fields=['name', 'cafe'], name='unique_name_cafe'),
        ]

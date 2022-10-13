from django.db import models
from common.models import UnsignedBigAutoField
from .validators import CustomValidator

cv = CustomValidator()


class Cafe(models.Model):
    cafe_id = UnsignedBigAutoField(primary_key=True)
    main_name = models.CharField(max_length=165)
    is_operated = models.SmallIntegerField(default=True)
    is_franchise = models.BooleanField(default=False)
    phone = models.CharField(max_length=15, null=True, blank=True)
    hours = models.JSONField(default=dict, null=True, blank=True)
    sns = models.JSONField(default=dict, null=True, blank=True)
    registrant = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        """
        제약사항:
            1. 중복된 name은 없어야한다.
        """
        constraints = [
            models.UniqueConstraint(fields=['main_name'], name='unique_main_name'),
        ]

class CafeSubName(models.Model):
    sub_name_id = UnsignedBigAutoField(primary_key=True)
    sub_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='sub_name', null=True, blank=True)

    class Meta:
        db_table = 'cafe_sub_name'

        """
        제약사항:
            1. 같은 cafe_id 안에서 중복된 sub_name은 없어야한다.
        """
        constraints = [
            models.UniqueConstraint(fields=['sub_name', 'cafe'], name='unique_sub_name_cafe'),
        ]


class Address(models.Model):
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='address', primary_key=True, blank=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=6, validators=[cv.decimal(6, 9)])
    longtitude = models.DecimalField(max_digits=9, decimal_places=6, validators=[cv.decimal(6, 9)])
    sido = models.CharField(max_length=40, validators=[cv.korean()])
    sigungu = models.CharField(max_length=40, validators=[cv.korean()])
    doro = models.CharField(max_length=40, validators=[cv.korean()])
    doro_code = models.CharField(max_length=10, validators=[])
    sangse = models.CharField(max_length=165, null=True, validators=[cv.korean_digit()])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        """
        제약사항:
            1. 중복된 (latitude, longtitude) 없어야한다.
        """
        constraints = [
            models.UniqueConstraint(fields=['latitude', 'longtitude'], name='unique_latitude_longtitude'),
        ]


class Menu(models.Model):
    menu_id = UnsignedBigAutoField(primary_key=True)
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='menu', null=True, blank=True)
    name = models.CharField(max_length=40, validators=[cv.korean_unicode_digit()])
    price = models.PositiveIntegerField(default=0, null=True, validators=[cv.korean_unicode_digit()])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        """
        제약사항:
            1. cafe_id가 같은 경우, 중복된 name은 없어야한다.
        """
        constraints = [
             models.UniqueConstraint(fields=['name', 'cafe'], name='unique_name_cafe'),
        ]


class MenuImage(models.Model):
    manu_image_id = UnsignedBigAutoField(primary_key=True)
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='menu_image', null=True, blank=True)
    image_url = models.CharField(max_length=2000)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'cafe_menu_image'
        

class Franchise(models.Model):
    cafe = models.ForeignKey(Cafe, on_delete=models.CASCADE, related_name='franchise', primary_key=True, blank=True)
    branch_name = models.CharField(max_length=40, validators=[cv.korean_unicode_digit()])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        """
        제약사항:
            1. cafe_id가 같은 경우, 중복된 branch_name 없어야한다.
        """
        constraints = [
             models.UniqueConstraint(fields=['branch_name', 'cafe'], name='unique_branch_name_cafe'),
        ]

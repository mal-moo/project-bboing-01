from django.db import transaction
from rest_framework import serializers
from .models import Cafe, Address, Menu


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Menu
        fields = '__all__'


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = '__all__'


class CafeSerializer(serializers.ModelSerializer):
    address = AddressSerializer(many=True)
    menu = MenuSerializer(many=True)

    class Meta:
        fields = ('name', 'name_en', 'phone', 'hours', 'sns', 'create_date', 'address', 'menu')
        model = Cafe

    def create(self, validated_data):
        address = validated_data.pop('address')
        menu = validated_data.pop('menu')
        cafe_instance = Cafe.objects.create(**validated_data)
        Address.objects.create(cafe=cafe_instance, **address[0])
        Menu.objects.create(cafe=cafe_instance, **menu[0])
        return cafe_instance

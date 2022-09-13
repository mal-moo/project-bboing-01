from django.db import IntegrityError, transaction
from rest_framework import serializers
from .models import Cafe, Address, Menu, MenuImage, Franchise


class FranchiseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Franchise
        fields = '__all__'
        
        
class MenuImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = MenuImage
        fields = '__all__'


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
    menu = MenuSerializer(many=True, required=False, allow_null=True) 
    franchise = FranchiseSerializer(many=True, required=False, allow_null=True)
    menu_image = MenuImageSerializer(many=True, required=False, allow_null=True)

    class Meta:
        fields = ('id', 'name', 'sub_names', 'phone', 'hours', 'sns', 'created_at', 'updated_at', \
            'address', 'menu', 'menu_image', 'franchise')
        model = Cafe

    def create(self, validated_data):
        franchise, menues, menu_images = None, [], []
        
        with transaction.atomic():
            address = validated_data.pop('address')
            if 'franchise' in validated_data:
                franchise = validated_data.pop('franchise')
            if 'menu' in validated_data:
                menues = validated_data.pop('menu')
            if 'menu_image' in validated_data:
                menu_images = validated_data.pop('menu_image')
            
            try:
                cafe_instance = Cafe.objects.create(**validated_data)
            except IntegrityError:
                raise serializers.ValidationError({"msg": "duplicate"})
            
            try:  
                Address.objects.create(cafe=cafe_instance, **address[0])
            except IntegrityError:
                raise serializers.ValidationError({"msg": "duplicate"})

            if franchise:
                Franchise.objects.create(cafe=cafe_instance, **franchise[0])

            for menu in menues:
                Menu.objects.create(cafe=cafe_instance, **menu)
            for menu_image in menu_images:
                MenuImage.objects.create(cafe=cafe_instance, **menu_image)
            
        return cafe_instance

    def update(self, instance, validated_data):
        address = validated_data.pop('address')[0]  
        menues = validated_data.pop('menu')
        menu_images = validated_data.pop('menu_image')
        
        instance.phone = validated_data.get('phone', instance.phone)
        instance.hours = validated_data.get('hours', instance.hours)
        instance.sns = validated_data.get('sns', instance.sns)
        instance.save()
        
        if Address.objects.filter(cafe=instance.pk).exists():
            address_instance = Address.objects.get(cafe=instance.pk)
            address_instance.latitude = address.get('latitude', address_instance.latitude)
            address_instance.longtitude = address.get('longtitude', address_instance.longtitude)
            address_instance.sido = address.get('sido', address_instance.sido)
            address_instance.doro_code = address.get('doro_code', address_instance.doro_code)
            address_instance.doro = address.get('doro', address_instance.doro)        
            address_instance.sigungu = address.get('sigungu', address_instance.sigungu)
            address_instance.sangse = address.get('sangse', address_instance.sangse)
            address_instance.save()

        for menu in menues:
            if Menu.objects.filter(cafe=instance.pk, name=menu['name']).exists():
                menu_instance = Menu.objects.get(cafe=instance.pk, name=menu['name'])
                menu_instance.name = menu.get('name', menu_instance.name)
                menu_instance.price = menu.get('price', menu_instance.price)
                menu_instance.save()
            else:
                Menu.objects.create(cafe=instance, **menu) 
        
        for menu_image in menu_images:
            if MenuImage.objects.filter(cafe=instance.pk, image_url=menu_image['image_url']).exists():
                menu_image_instance = Menu.objects.get(cafe=instance.pk, image_url=menu_image['image_url'])
                menu_image_instance.image_url = menu.get('image_url', menu_image_instance.image_url)
                menu_image_instance.save()
            else:
                MenuImage.objects.create(cafe=instance, **menu_image) 

        return instance
        
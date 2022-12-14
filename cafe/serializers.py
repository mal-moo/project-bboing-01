from django.db import IntegrityError, transaction
from rest_framework.serializers import ModelSerializer, DateTimeField, ValidationError

from config.settings import DATETIME_FORMAT
from .models import Cafe, Address, CafeSubName, Menu, MenuImage, Franchise


class FranchiseSerializer(ModelSerializer):
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        model = Franchise
        # fields = '__all__'
        exclude = ('cafe', )
    
        
class MenuImageSerializer(ModelSerializer):
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        model = MenuImage
        # fields = '__all__'
        exclude = ('cafe', )


class MenuSerializer(ModelSerializer):
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        model = Menu
        # fields = '__all__'
        exclude = ('cafe', )


class AddressSerializer(ModelSerializer):
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        model = Address
        # fields = '__all__'
        exclude = ('cafe', )


class CafeSubNameSerializer(ModelSerializer):
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        model = CafeSubName
        # fields = '__all__'
        exclude = ('cafe', )


class CafeSerializer(ModelSerializer):
    address = AddressSerializer(many=True)
    menu = MenuSerializer(many=True, required=False, allow_null=True) 
    sub_name = CafeSubNameSerializer(many=True, required=False, allow_null=True)
    franchise = FranchiseSerializer(many=True, required=False, allow_null=True)
    menu_image = MenuImageSerializer(many=True, required=False, allow_null=True)
    created_at = DateTimeField(format=DATETIME_FORMAT, required=False)
    updated_at = DateTimeField(format=DATETIME_FORMAT, required=False)

    class Meta:
        fields = ('cafe_id', 'main_name', 'phone', 'hours', 'sns', 'created_at', 'updated_at', \
            'sub_name', 'address', 'menu', 'menu_image', 'franchise')
        model = Cafe

    def create(self, validated_data):
        sub_names, franchise, menues, menu_images = [], None, [], []
        
        with transaction.atomic():
            address = validated_data.pop('address')
            if 'franchise' in validated_data:
                franchise = validated_data.pop('franchise')
            if 'menu' in validated_data:
                menues = validated_data.pop('menu')
            if 'menu_image' in validated_data:
                menu_images = validated_data.pop('menu_image')
            if 'sub_name' in validated_data:
                sub_names = validated_data.pop('sub_name')
            
            if len(sub_names) > 3:
                raise ValidationError({"msg": "overed datas"})
            
            if len(menu_images) > 5:
                raise ValidationError({"msg": "overed datas"})
            
            try:
                cafe_instance = Cafe.objects.create(**validated_data)
            except IntegrityError:
                raise ValidationError({"msg": "duplicate"})
            
            try:  
                Address.objects.create(cafe=cafe_instance, **address[0])
            except IntegrityError:
                raise ValidationError({"msg": "duplicate"})

            if franchise:
                Franchise.objects.create(cafe=cafe_instance, **franchise[0])
            
            for sub_name in sub_names:
                CafeSubName.objects.create(cafe=cafe_instance, **sub_name)

            for menu in menues:
                Menu.objects.create(cafe=cafe_instance, **menu)
            
            for menu_image in menu_images:
                MenuImage.objects.create(cafe=cafe_instance, **menu_image)
            
        return cafe_instance

    def update(self, instance, validated_data):
        address = validated_data.pop('address')[0]  
        menues = validated_data.pop('menu')
        menu_images = validated_data.pop('menu_image')
        sub_names = validated_data.pop('sub_name')
        
        with transaction.atomic():

            instance.phone = validated_data.get('phone', instance.phone)
            instance.hours = validated_data.get('hours', instance.hours)
            instance.sns = validated_data.get('sns', instance.sns)
            instance.save()
            
            if CafeSubName.objects.filter(cafe=instance.pk).__len__() > 3:
                raise ValidationError({"msg": "overed datas"}) 

            if MenuImage.objects.filter(cafe=instance.pk).__len__() > 5:
                raise ValidationError({"msg": "overed datas"}) 

            try:
                if Address.objects.filter(cafe=instance.pk).exists():
                    address_instance = Address.objects.get(cafe=instance.pk)
                    if address_instance.latitude != address['latitude'] and address_instance.longtitude != address['longtitude']:
                        address_instance.latitude = address.get('latitude', address_instance.latitude)
                        address_instance.longtitude = address.get('longtitude', address_instance.longtitude)
                        address_instance.sido = address.get('sido', address_instance.sido)
                        address_instance.doro_code = address.get('doro_code', address_instance.doro_code)
                        address_instance.doro = address.get('doro', address_instance.doro)        
                        address_instance.sigungu = address.get('sigungu', address_instance.sigungu)
                        address_instance.sangse = address.get('sangse', address_instance.sangse)
                        address_instance.save()
            except IntegrityError:
                raise ValidationError({"msg": "duplicate"})

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
                    menu_image_instance = MenuImage.objects.get(cafe=instance.pk, image_url=menu_image['image_url'])
                    menu_image_instance.image_url = menu.get('image_url', menu_image_instance.image_url)
                    menu_image_instance.save()
                else:
                    MenuImage.objects.create(cafe=instance, **menu_image) 
            
            for sub_name in sub_names:
                if CafeSubName.objects.filter(cafe=instance.pk, sub_name=sub_name['sub_name']).exists():
                    sub_name_instance = CafeSubName.objects.get(cafe=instance.pk, sub_name=sub_name['sub_name'])
                    sub_name_instance.sub_name = sub_name.get('sub_name', sub_name_instance.sub_name)
                    sub_name_instance.save()
                else:
                    CafeSubName.objects.create(cafe=instance, **sub_name) 

        return instance
        
from django.db import IntegrityError
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
    """
        1. 3개 테이블 인서트 쿼리:
            1.1 
            INSERT INTO cafe_cafe(name, name_en, phone, hours, sns, create_date) \
                VALUES('공지은', 'Kong', '01012341234', '{"mon":"9-6"}', '{"instagram":"instagram.com"}', CURRENT_TIMESTAMP);
            1.2
            INSERT INTO cafe_address(latitude, longtitude, sido, sigungu, doro, doro_code, sangse, cafe_id, update_date) \
                VALUES(1 ,1, 'b', 'b', 'b', 0, 'b', 5, CURRENT_TIMESTAMP);
            1.3
            INSERT INTO cafe_menu(image_url, name, price, cafe_id, update_date) VALUES('test', 'latte', 6000, 5, CURRENT_TIMESTAMP);
        2. 3개 테이블 조회 쿼리:
            SELECT
            cafe_cafe.*,
            cafe_address.*,
            cafe_menu.*
            FROM cafe_cafe
            JOIN cafe_address
            ON cafe_cafe.id = cafe_address.cafe_id
            JOIN cafe_menu
            ON cafe_cafe.id = cafe_menu.cafe_id;
    """
    address = AddressSerializer(many=True)
    menu = MenuSerializer(many=True)

    class Meta:
        fields = ('name', 'name_en', 'phone', 'hours', 'sns', 'create_date', 'address', 'menu')
        model = Cafe

    def create(self, validated_data):
        address = validated_data.pop('address')
        menues = validated_data.pop('menu')
        
        try:
            cafe_instance = Cafe.objects.create(**validated_data)
        except IntegrityError:
            raise serializers.ValidationError({"msg": "duplicate"})
            
        Address.objects.create(cafe=cafe_instance, **address[0])
        for menu in menues:
            Menu.objects.create(cafe=cafe_instance, **menu)
        
        return cafe_instance

    def update(self, instance, validated_data):
        # address = validated_data.pop('address')[0]  # 주소가 수정이 된다면 
        menues = validated_data.pop('menu')
        
        instance.phone = validated_data.get('phone', instance.phone)
        instance.hours = validated_data.get('hours', instance.hours)
        instance.sns = validated_data.get('sns', instance.sns)
        instance.save()
        
        # if Address.objects.filter(cafe=instance.pl).exists():
        #     address_instance = Address.objects.get(cafe=instance.pk)
        #     address_instance.latitude = address.get('latitude', address_instance.latitude)
        #     address_instance.longtitude = address.get('longtitude', address_instance.longtitude)
        #     address_instance.sido = address.get('sido', address_instance.sido)
        #     address_instance.doro_code = address.get('doro_code', address_instance.doro_code)
        #     address_instance.doro = address.get('doro', address_instance.doro)        
        #     address_instance.sigungu = address.get('sigungu', address_instance.sigungu)
        #     address_instance.save()

        for menu in menues:
            if Menu.objects.filter(cafe=instance.pk, name=menu['name']).exists():
                menu_instance = Menu.objects.get(cafe=instance.pk, name=menu['name'])
                menu_instance.name = menu.get('name', menu_instance.name)
                menu_instance.price = menu.get('price', menu_instance.price)
                menu_instance.image_url = menu.get('image_url', menu_instance.image_url)
                menu_instance.save()
            else:
                Menu.objects.create(cafe=instance, **menu) 

        return instance
        
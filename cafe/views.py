from rest_framework import viewsets
from .serializers import CafeSerializer
from .models import Cafe

"""
viewsets을 이용하여 CRUD API 만들기
"""
class CafeViewset(viewsets.ModelViewSet):
    """
    리스펀스 메시지 핸들링 공부 필요
    """
    queryset = Cafe.objects.all()
    serializer_class = CafeSerializer
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']

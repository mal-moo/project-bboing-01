# from django.db import transaction
# from rest_framework import generics, status
# from rest_framework.permissions import AllowAny
# from rest_framework.response import Response
from rest_framework import viewsets
from .serializers import CafeSerializer
from .models import Cafe


class CafeViewset(viewsets.ModelViewSet):
    queryset = Cafe.objects.all()
    serializer_class = CafeSerializer
    http_method_names = ['get', 'post', 'put', 'patch']

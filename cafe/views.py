from rest_framework import viewsets, status
from rest_framework.response import Response
from .serializers import CafeSerializer
from .models import Cafe

"""
viewsets을 이용하여 CRUD API 만들기
"""
class CafeViewset(viewsets.ModelViewSet):
    queryset = Cafe.objects.all()
    serializer_class = CafeSerializer
    http_method_names = ['get', 'post', 'put', 'patch', 'delete']

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({
                'detail': 'Successfully deleted'
            }, status=status.HTTP_204_NO_CONTENT)

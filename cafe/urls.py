from django.urls import path, include
from .views import CafeViewset
from rest_framework.routers import DefaultRouter

router = DefaultRouter()  
router.register('',CafeViewset)

urlpatterns = [
    path('', include(router.urls)),
]
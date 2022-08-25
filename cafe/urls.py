# from django.urls import path
# from . import views

# urlpatterns = [
#     # path('', views.CafeDetail.as_view())
#     path('', views.ListCreateCafe.as_view())
# ]

from django.urls import path, include
from .views import CafeViewset
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('',CafeViewset)

urlpatterns = [
    path('', include(router.urls)),
]
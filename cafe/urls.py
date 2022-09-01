from django.urls import path, include
from .views import CafeViewset
from rest_framework.routers import DefaultRouter

"""
viewset은 하나의 클래스에 CRUD기능이 모두 포함되어있기 때문에 하나의 path로 표현이 불가능하다. 
그래서 서로 다른 path를 하나로 묶어주는 과정이 필요하다.
as_view() 함수를 활용하는 방법과 router를 활용하는 방법 중 router를 활용했다.
(https://wisdom-990629.tistory.com/entry/DRF-ViewSet%EC%9C%BC%EB%A1%9C-CRUD-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)
"""
router = DefaultRouter()  
router.register('',CafeViewset)

urlpatterns = [
    path('', include(router.urls)),
]
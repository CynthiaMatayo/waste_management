from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    WasteStatisticsViewSet,
    UserStatisticsViewSet,
    CarbonFootprintViewSet,
    CarbonFootprintCalculationViewSet
)

router = DefaultRouter()
router.register(r'waste', WasteStatisticsViewSet, basename='waste-statistics')
router.register(r'users', UserStatisticsViewSet, basename='user-statistics')
router.register(r'carbon-footprint', CarbonFootprintViewSet, basename='carbon-footprint')
router.register(r'carbon-calculations', CarbonFootprintCalculationViewSet, basename='carbon-calculations')

urlpatterns = [
    path('', include(router.urls)),
]

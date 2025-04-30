from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import WasteCategoryViewSet, WasteItemViewSet, DisposalMethodViewSet, WasteTipViewSet

router = DefaultRouter()
router.register(r'categories', WasteCategoryViewSet)
router.register(r'items', WasteItemViewSet)
router.register(r'disposal-methods', DisposalMethodViewSet)
router.register(r'tips', WasteTipViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
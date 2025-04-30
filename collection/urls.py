from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    CollectionScheduleViewSet,
    CollectionRequestViewSet,
    CollectionAssignmentViewSet,
    WasteCollectionViewSet,
    FeedbackRatingViewSet
)

router = DefaultRouter()
router.register(r'schedules', CollectionScheduleViewSet, basename='collection-schedule')
router.register(r'requests', CollectionRequestViewSet, basename='collection-request')
router.register(r'assignments', CollectionAssignmentViewSet, basename='collection-assignment')
router.register(r'waste-collections', WasteCollectionViewSet, basename='waste-collection')
router.register(r'feedback', FeedbackRatingViewSet, basename='feedback')

urlpatterns = [
    path('', include(router.urls)),
]

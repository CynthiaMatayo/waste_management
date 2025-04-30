from rest_framework import viewsets, permissions, filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import WasteCategory, WasteItem, DisposalMethod, WasteTip
from .serializers import (
    WasteCategorySerializer, 
    WasteItemSerializer,
    DisposalMethodSerializer,
    WasteTipSerializer
)

class WasteCategoryViewSet(viewsets.ModelViewSet):
    queryset = WasteCategory.objects.all()
    serializer_class = WasteCategorySerializer
    permission_classes = [permissions.AllowAny]
    filter_backends = [filters.SearchFilter]
    search_fields = ['name']

class WasteItemViewSet(viewsets.ModelViewSet):
    queryset = WasteItem.objects.all()
    serializer_class = WasteItemSerializer
    permission_classes = [permissions.AllowAny]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['category', 'is_recyclable']
    search_fields = ['name', 'description']
    
    def get_queryset(self):
        queryset = WasteItem.objects.all()
        category_id = self.request.query_params.get('category_id')
        if category_id:
            queryset = queryset.filter(category_id=category_id)
        return queryset

class DisposalMethodViewSet(viewsets.ModelViewSet):
    queryset = DisposalMethod.objects.all()
    serializer_class = DisposalMethodSerializer
    permission_classes = [permissions.AllowAny]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['applicable_categories']
    search_fields = ['name', 'description']

class WasteTipViewSet(viewsets.ModelViewSet):
    queryset = WasteTip.objects.all()
    serializer_class = WasteTipSerializer
    permission_classes = [permissions.AllowAny]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['categories']
    search_fields = ['title', 'content']
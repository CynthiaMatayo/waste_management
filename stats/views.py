from rest_framework import viewsets, permissions, filters, status
from rest_framework.response import Response
from rest_framework.decorators import action
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Sum, Count, Avg, F, ExpressionWrapper, FloatField
from django.db.models.functions import TruncMonth, TruncWeek, TruncDay
from django.utils import timezone
from datetime import timedelta, date
from dateutil.relativedelta import relativedelta
from .models import WasteStatistics, UserStatistics, CarbonFootprintCalculation, CarbonFootprint
from waste.models import WasteCategory
from collection.models import WasteCollection
from .serializers import (
    WasteStatisticsSerializer,
    UserStatisticsSerializer,
    CarbonFootprintCalculationSerializer,
    CarbonFootprintSerializer
)

class WasteStatisticsViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = WasteStatisticsSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    filterset_fields = ['waste_category', 'date']
    ordering_fields = ['date', 'total_weight', 'collection_count']
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return WasteStatistics.objects.all()
        elif user.user_type == 'collector':
            # Get statistics for collections the user has made
            return WasteStatistics.objects.filter(
                waste_category__in=WasteCategory.objects.filter(
                    collection_requests__assignment__collector=user
                ).distinct()
            )
        # For clients, show only their waste statistics
        return WasteStatistics.objects.filter(
            waste_category__in=WasteCategory.objects.filter(
                collection_requests__client=user
            ).distinct()
        )
    
    @action(detail=False, methods=['get'])
    def summary(self, request):
        # Time period filters
        period = request.query_params.get('period', 'month')
        end_date = date.today()
        
        if period == 'week':
            start_date = end_date - timedelta(days=7)
        elif period == 'month':
            start_date = end_date - relativedelta(months=1)
        elif period == 'quarter':
            start_date = end_date - relativedelta(months=3)
        elif period == 'year':
            start_date = end_date - relativedelta(years=1)
        else:
            start_date = end_date - relativedelta(months=1)  # Default to month
        
        # Get waste statistics for the period
        stats = WasteStatistics.objects.filter(date__range=[start_date, end_date])
        
        # Apply user role filtering
        user = request.user
        if user.user_type not in ['admin', 'manager']:
            if user.user_type == 'collector':
                stats = stats.filter(
                    waste_category__in=WasteCategory.objects.filter(
                        collection_requests__assignment__collector=user
                    ).distinct()
                )
            else:  # client
                stats = stats.filter(
                    waste_category__in=WasteCategory.objects.filter(
                        collection_requests__client=user
                    ).distinct()
                )
        
        # Group by waste category
        summary_by_category = stats.values('waste_category__name').annotate(
            total_weight=Sum('total_weight'),
            collection_count=Sum('collection_count')
        ).order_by('-total_weight')
        
        # Get totals
        total_weight = stats.aggregate(Sum('total_weight'))['total_weight__sum'] or 0
        total_collections = stats.aggregate(Sum('collection_count'))['collection_count__sum'] or 0
        
        # Time series data
        if period == 'week':
            time_series = stats.annotate(grouped_date=TruncDay('date')).values('grouped_date').annotate(
                total_weight=Sum('total_weight'),
                collection_count=Sum('collection_count')
            ).order_by('grouped_date')
        elif period == 'year':
            time_series = stats.annotate(grouped_date=TruncMonth('date')).values('grouped_date').annotate(
                total_weight=Sum('total_weight'),
                collection_count=Sum('collection_count')
            ).order_by('grouped_date')
        else:
            time_series = stats.annotate(grouped_date=TruncWeek('date')).values('grouped_date').annotate(
                total_weight=Sum('total_weight'),
                collection_count=Sum('collection_count')
            ).order_by('grouped_date')
        
        return Response({
            'period': period,
            'start_date': start_date,
            'end_date': end_date,
            'total_weight': total_weight,
            'total_collections': total_collections,
            'by_category': summary_by_category,
            'time_series': time_series
        })

class UserStatisticsViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = UserStatisticsSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    filterset_fields = ['user', 'date']
    ordering_fields = ['date', 'total_waste_recycled', 'total_waste_disposed', 'collection_count']
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return UserStatistics.objects.all()
        return UserStatistics.objects.filter(user=user)
    
    @action(detail=False, methods=['get'])
    def leaderboard(self, request):
        # Create a leaderboard based on waste recycled
        period = request.query_params.get('period', 'month')
        end_date = date.today()
        
        if period == 'week':
            start_date = end_date - timedelta(days=7)
        elif period == 'month':
            start_date = end_date - relativedelta(months=1)
        elif period == 'quarter':
            start_date = end_date - relativedelta(months=3)
        elif period == 'year':
            start_date = end_date - relativedelta(years=1)
        else:
            start_date = end_date - relativedelta(months=1)  # Default to month
        
        # Get user statistics for the period
        stats = UserStatistics.objects.filter(date__range=[start_date, end_date])
        
        # Group by user and calculate totals
        leaderboard = stats.values('user', 'user__first_name', 'user__last_name').annotate(
            total_recycled=Sum('total_waste_recycled'),
            total_disposed=Sum('total_waste_disposed'),
            total_collections=Sum('collection_count'),
            recycling_ratio=ExpressionWrapper(
                F('total_waste_recycled') / (F('total_waste_recycled') + F('total_waste_disposed')),
                output_field=FloatField()
            )
        ).order_by('-total_recycled')[:10]  # Top 10
        
        return Response({
            'period': period,
            'start_date': start_date,
            'end_date': end_date,
            'leaderboard': leaderboard
        })

class CarbonFootprintViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = CarbonFootprintSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    filterset_fields = ['user', 'date']
    ordering_fields = ['date', 'total_emissions', 'emissions_saved']
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return CarbonFootprint.objects.all()
        return CarbonFootprint.objects.filter(user=user)
    
    @action(detail=False, methods=['get'])
    def summary(self, request):
        # Time period filters
        period = request.query_params.get('period', 'month')  
        end_date = date.today()
        
        if period == 'week':
            start_date = end_date - timedelta(days=7)
        elif period == 'month':
            start_date = end_date - relativedelta(months=1)
        elif period == 'quarter':
            start_date = end_date - relativedelta(months=3)
        elif period == 'year':
            start_date = end_date - relativedelta(years=1)
        else:
            start_date = end_date - relativedelta(months=1)  # Default to month
        
        # Get footprint data
        footprints = CarbonFootprint.objects.filter(date__range=[start_date, end_date])
        
        # Apply user role filtering
        user = request.user
        if user.user_type not in ['admin', 'manager']:
            footprints = footprints.filter(user=user)
        
        # Calculate totals
        total_emissions = footprints.aggregate(Sum('total_emissions'))['total_emissions__sum'] or 0
        total_saved = footprints.aggregate(Sum('emissions_saved'))['emissions_saved__sum'] or 0
        
        # Time series data
        if period == 'week':
            time_series = footprints.annotate(grouped_date=TruncDay('date')).values('grouped_date').annotate(
                emissions=Sum('total_emissions'),
                saved=Sum('emissions_saved')
            ).order_by('grouped_date')
        elif period == 'year':
            time_series = footprints.annotate(grouped_date=TruncMonth('date')).values('grouped_date').annotate(
                emissions=Sum('total_emissions'),
                saved=Sum('emissions_saved')
            ).order_by('grouped_date')
        else:
            time_series = footprints.annotate(grouped_date=TruncWeek('date')).values('grouped_date').annotate(
                emissions=Sum('total_emissions'),
                saved=Sum('emissions_saved')
            ).order_by('grouped_date')
        
        return Response({
            'period': period,
            'start_date': start_date,
            'end_date': end_date,
            'total_emissions': total_emissions,
            'total_saved': total_saved,
            'net_impact': total_emissions - total_saved,
            'time_series': time_series
        })

class CarbonFootprintCalculationViewSet(viewsets.ModelViewSet):
    serializer_class = CarbonFootprintCalculationSerializer
    permission_classes = [permissions.IsAuthenticated]
    queryset = CarbonFootprintCalculation.objects.all()
    
    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            self.permission_classes = [permissions.IsAdminUser]
        return super().get_permissions()
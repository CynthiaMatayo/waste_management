from datetime import datetime, timedelta
from django.db.models import Count, Avg, Sum
from django.utils import timezone
from accounts.models import User
from collection.models import CollectionRequest, WasteCollection
from waste.models import WasteCategory

def get_collection_stats(days=30):
    end_date = timezone.now()
    start_date = end_date - timedelta(days=days)
    
    stats = {
        'total_collections': CollectionRequest.objects.filter(
            status='completed', 
            updated_at__range=[start_date, end_date]
        ).count(),
        
        'waste_by_category': WasteCollection.objects.filter(
            collected_at__range=[start_date, end_date]
        ).values('waste_category__name').annotate(
            total_weight=Sum('weight')
        ).order_by('-total_weight'),
        
        'collections_by_day': CollectionRequest.objects.filter(
            status='completed',
            updated_at__range=[start_date, end_date]
        ).extra(
            select={'day': "DATE(updated_at)"}
        ).values('day').annotate(count=Count('id')).order_by('day'),
        
        'average_rating': CollectionRequest.objects.filter(
            status='completed',
            updated_at__range=[start_date, end_date],
            assignment__feedback__isnull=False
        ).aggregate(avg_rating=Avg('assignment__feedback__rating'))['avg_rating'] or 0,
    }
    
    return stats

def get_user_stats():
    return {
        'total_users': User.objects.count(),
        'clients': User.objects.filter(user_type='client').count(),
        'collectors': User.objects.filter(user_type='collector').count(),
        'managers': User.objects.filter(user_type='manager').count(),
        'admins': User.objects.filter(user_type='admin').count(),
    }
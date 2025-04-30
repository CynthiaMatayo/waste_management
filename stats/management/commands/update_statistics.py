import logging
from django.core.management.base import BaseCommand
from django.utils import timezone
from django.db.models import Sum
from datetime import timedelta
from waste.models import WasteCategory
from collection.models import WasteCollection
from accounts.models import User
from stats.models import WasteStatistics, UserStatistics, CarbonFootprint, CarbonFootprintCalculation

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Update waste statistics and carbon footprint data'
    
    def handle(self, *args, **options):
        yesterday = timezone.now().date() - timedelta(days=1)
        self.stdout.write(f"Updating statistics for {yesterday}")
        
        # Update waste statistics
        self.update_waste_statistics(yesterday)
        
        # Update user statistics
        self.update_user_statistics(yesterday)
        
        # Update carbon footprint
        self.update_carbon_footprints(yesterday)
        
        self.stdout.write(self.style.SUCCESS(f"Successfully updated statistics for {yesterday}"))
    
    def update_waste_statistics(self, date):
        # For each waste category, calculate total weight and count
        for category in WasteCategory.objects.all():
            collections = WasteCollection.objects.filter(
                waste_category=category,
                collected_at__date=date
            )
            
            if collections.exists():
                total_weight = collections.aggregate(Sum('weight'))['weight__sum'] or 0
                count = collections.count()
                
                # Create or update statistics
                WasteStatistics.objects.update_or_create(
                    date=date,
                    waste_category=category,
                    defaults={
                        'total_weight': total_weight,
                        'collection_count': count
                    }
                )
                self.stdout.write(f"Updated waste statistics for {category}: {total_weight}kg, {count} collections")
    
    def update_user_statistics(self, date):
        # For each client user, calculate their waste statistics
        for user in User.objects.filter(user_type='client'):
            # Get all waste collections for this user's requests on the given date
            collections = WasteCollection.objects.filter(
                assignment__collection_request__client=user,
                collected_at__date=date
            )
            
            if collections.exists():
                # Calculate total waste by type (recyclable vs non-recyclable)
                recyclable = collections.filter(
                    waste_category__waste_items__is_recyclable=True
                ).distinct().aggregate(Sum('weight'))['weight__sum'] or 0
                
                non_recyclable = collections.filter(
                    waste_category__waste_items__is_recyclable=False
                ).distinct().aggregate(Sum('weight'))['weight__sum'] or 0
                
                count = collections.count()
                
                # Create or update user statistics
                UserStatistics.objects.update_or_create(
                    user=user,
                    date=date,
                    defaults={
                        'total_waste_recycled': recyclable,
                        'total_waste_disposed': non_recyclable,
                        'collection_count': count
                    }
                )
                self.stdout.write(f"Updated statistics for {user}: {recyclable}kg recycled, {non_recyclable}kg disposed")
    
    def update_carbon_footprints(self, date):
        # For each client user, calculate carbon footprint
        for user in User.objects.filter(user_type='client'):
            # Get all waste collections for this user's requests on the given date
            collections = WasteCollection.objects.filter(
                assignment__collection_request__client=user,
                collected_at__date=date
            )
            
            if collections.exists():
                total_emissions = 0
                total_saved = 0
                
                # Calculate emissions for each collection
                for collection in collections:
                    try:
                        carbon_calc = CarbonFootprintCalculation.objects.get(
                            waste_category=collection.waste_category
                        )
                        
                        # Calculate emissions
                        co2_emitted = float(collection.weight) * float(carbon_calc.co2_per_kg)
                        total_emissions += co2_emitted
                        
                        # Calculate savings if waste is recyclable
                        is_recyclable = collection.waste_category.waste_items.filter(is_recyclable=True).exists()
                        if is_recyclable:
                            co2_saved = co2_emitted * float(carbon_calc.reduction_factor_if_recycled) / 100
                            total_saved += co2_saved
                            
                    except CarbonFootprintCalculation.DoesNotExist:
                        logger.warning(f"No carbon calculation found for category {collection.waste_category}")
                
                # Create or update carbon footprint
                CarbonFootprint.objects.update_or_create(
                    user=user,
                    date=date,
                    defaults={
                        'total_emissions': total_emissions,
                        'emissions_saved': total_saved
                    }
                )
                self.stdout.write(f"Updated carbon footprint for {user}: {total_emissions}kg CO2, {total_saved}kg CO2 saved")
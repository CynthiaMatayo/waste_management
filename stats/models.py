from django.db import models
from django.conf import settings
from waste.models import WasteCategory

class WasteStatistics(models.Model):
    date = models.DateField()
    waste_category = models.ForeignKey(WasteCategory, on_delete=models.CASCADE, related_name='statistics')
    total_weight = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    collection_count = models.IntegerField(default=0)
    
    class Meta:
        unique_together = ('date', 'waste_category')
        verbose_name_plural = 'Waste Statistics'
    
    def __str__(self):
        return f"{self.waste_category.name} - {self.date}"

class UserStatistics(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='statistics')
    date = models.DateField()
    total_waste_recycled = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    total_waste_disposed = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    collection_count = models.IntegerField(default=0)
    
    class Meta:
        unique_together = ('user', 'date')
        verbose_name_plural = 'User Statistics'
    
    def __str__(self):
        return f"{self.user.get_full_name()} - {self.date}"

class CarbonFootprintCalculation(models.Model):
    waste_category = models.ForeignKey(WasteCategory, on_delete=models.CASCADE)
    co2_per_kg = models.DecimalField(max_digits=10, decimal_places=2, help_text="CO2 equivalent per kg of waste")
    reduction_factor_if_recycled = models.DecimalField(max_digits=5, decimal_places=2, help_text="Percentage reduction if recycled")
    
    def __str__(self):
        return f"{self.waste_category.name} - {self.co2_per_kg} CO2eq/kg"

class CarbonFootprint(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='carbon_footprints')
    date = models.DateField()
    total_emissions = models.DecimalField(max_digits=10, decimal_places=2, help_text="kg of CO2 equivalent")
    emissions_saved = models.DecimalField(max_digits=10, decimal_places=2, help_text="kg of CO2 equivalent saved via recycling")
    
    class Meta:
        unique_together = ('user', 'date')
    
    def __str__(self):
        return f"{self.user.get_full_name()} - {self.date}"

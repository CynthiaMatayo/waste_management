from django.db import models
from django.conf import settings
from waste.models import WasteCategory

class CollectionSchedule(models.Model):
    FREQUENCY_CHOICES = (
        ('daily', 'Daily'),
        ('weekly', 'Weekly'),
        ('biweekly', 'Bi-Weekly'),
        ('monthly', 'Monthly'),
        ('custom', 'Custom'),
    )
    DAY_CHOICES = (
        (0, 'Monday'),
        (1, 'Tuesday'),
        (2, 'Wednesday'),
        (3, 'Thursday'),
        (4, 'Friday'),
        (5, 'Saturday'),
        (6, 'Sunday'),
    )
    
    client = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='collection_schedules')
    waste_categories = models.ManyToManyField(WasteCategory, related_name='collection_schedules')
    frequency = models.CharField(max_length=20, choices=FREQUENCY_CHOICES)
    collection_day = models.IntegerField(choices=DAY_CHOICES, blank=True, null=True)
    collection_time = models.TimeField(blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    custom_schedule = models.TextField(blank=True, null=True, help_text="For custom frequency, describe the schedule here")
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.client.get_full_name()} - {self.get_frequency_display()}"

class CollectionRequest(models.Model):
    STATUS_CHOICES = (
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    )
    
    client = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='collection_requests')
    waste_categories = models.ManyToManyField(WasteCategory, related_name='collection_requests')
    pickup_address = models.TextField()
    pickup_date = models.DateField()
    pickup_time_slot = models.CharField(max_length=50, help_text="e.g., 'Morning (8-12)', 'Afternoon (12-4)', etc.")
    special_instructions = models.TextField(blank=True, null=True)
    estimated_weight = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True, help_text="Weight in kg")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.client.get_full_name()} - {self.pickup_date}"

class CollectionAssignment(models.Model):
    STATUS_CHOICES = (
        ('assigned', 'Assigned'),
        ('in_progress', 'In Progress'),
        ('completed', 'Completed'),
        ('failed', 'Failed'),
        ('rescheduled', 'Rescheduled'),
    )
    
    collection_request = models.OneToOneField(CollectionRequest, on_delete=models.CASCADE, related_name='assignment')
    collector = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='assignments')
    assigned_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='assigned')
    actual_pickup_time = models.DateTimeField(blank=True, null=True)
    completion_time = models.DateTimeField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.collector.get_full_name()} - {self.collection_request}"

class WasteCollection(models.Model):
    assignment = models.ForeignKey(CollectionAssignment, on_delete=models.CASCADE, related_name='waste_collections')
    waste_category = models.ForeignKey(WasteCategory, on_delete=models.CASCADE)
    weight = models.DecimalField(max_digits=6, decimal_places=2, help_text="Weight in kg")
    photo_evidence = models.ImageField(upload_to='collection_evidence/', blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    collected_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.waste_category.name} - {self.weight} kg"

class FeedbackRating(models.Model):
    RATING_CHOICES = (
        (1, '1 - Poor'),
        (2, '2 - Fair'),
        (3, '3 - Good'),
        (4, '4 - Very Good'),
        (5, '5 - Excellent'),
    )
    
    collection_assignment = models.OneToOneField(CollectionAssignment, on_delete=models.CASCADE, related_name='feedback')
    rating = models.IntegerField(choices=RATING_CHOICES)
    comments = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.collection_assignment} - Rating: {self.rating}"
# Create your models here.

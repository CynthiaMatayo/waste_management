from django.db import models
from django.conf import settings

class WasteCategory(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    icon = models.ImageField(upload_to='waste_category_icons/', blank=True, null=True)
    
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'Waste Categories'

class WasteItem(models.Model):
    category = models.ForeignKey(WasteCategory, on_delete=models.CASCADE, related_name='waste_items')
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    is_recyclable = models.BooleanField(default=False)
    handling_instructions = models.TextField(blank=True, null=True)
    image = models.ImageField(upload_to='waste_item_images/', blank=True, null=True)
    
    def __str__(self):
        return self.name

class DisposalMethod(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    applicable_categories = models.ManyToManyField(WasteCategory, related_name='disposal_methods')
    
    def __str__(self):
        return self.name

class WasteTip(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    categories = models.ManyToManyField(WasteCategory, related_name='tips', blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title

# Create your models here.

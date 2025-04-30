from django.contrib import admin
from .models import WasteCategory, WasteItem, DisposalMethod, WasteTip

@admin.register(WasteCategory)
class WasteCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(WasteItem)
class WasteItemAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'is_recyclable')
    list_filter = ('category', 'is_recyclable')
    search_fields = ('name', 'description')

@admin.register(DisposalMethod)
class DisposalMethodAdmin(admin.ModelAdmin):
    list_display = ('name',)
    filter_horizontal = ('applicable_categories',)
    search_fields = ('name', 'description')

@admin.register(WasteTip)
class WasteTipAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_at')
    filter_horizontal = ('categories',)
    search_fields = ('title', 'content')
    list_filter = ('categories', 'created_at')
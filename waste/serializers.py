from rest_framework import serializers
from .models import WasteCategory, WasteItem, DisposalMethod, WasteTip

class WasteCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = WasteCategory
        fields = '__all__'

class WasteItemSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    
    class Meta:
        model = WasteItem
        fields = '__all__'

class DisposalMethodSerializer(serializers.ModelSerializer):
    applicable_categories = WasteCategorySerializer(many=True, read_only=True)
    
    class Meta:
        model = DisposalMethod
        fields = '__all__'

class WasteTipSerializer(serializers.ModelSerializer):
    categories = WasteCategorySerializer(many=True, read_only=True)
    
    class Meta:
        model = WasteTip
        fields = '__all__'

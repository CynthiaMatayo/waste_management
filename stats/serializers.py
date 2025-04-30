from rest_framework import serializers
from .models import WasteStatistics, UserStatistics, CarbonFootprintCalculation, CarbonFootprint
from waste.serializers import WasteCategorySerializer
from accounts.serializers import UserSerializer

class WasteStatisticsSerializer(serializers.ModelSerializer):
    waste_category_name = serializers.CharField(source='waste_category.name', read_only=True)
    
    class Meta:
        model = WasteStatistics
        fields = '__all__'

class UserStatisticsSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.get_full_name', read_only=True)
    user_type = serializers.CharField(source='user.user_type', read_only=True)
    
    class Meta:
        model = UserStatistics
        fields = '__all__'

class CarbonFootprintCalculationSerializer(serializers.ModelSerializer):
    waste_category_name = serializers.CharField(source='waste_category.name', read_only=True)
    
    class Meta:
        model = CarbonFootprintCalculation
        fields = '__all__'

class CarbonFootprintSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.get_full_name', read_only=True)
    
    class Meta:
        model = CarbonFootprint
        fields = '__all__'

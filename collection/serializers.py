from rest_framework import serializers

from waste.models import WasteCategory
from .models import (
    CollectionSchedule, 
    CollectionRequest, 
    CollectionAssignment, 
    WasteCollection, 
    FeedbackRating
)
from waste.serializers import WasteCategorySerializer
from accounts.serializers import UserSerializer

class CollectionScheduleSerializer(serializers.ModelSerializer):
    waste_categories = WasteCategorySerializer(many=True, read_only=True)
    waste_category_ids = serializers.PrimaryKeyRelatedField(
        many=True, 
        write_only=True,
        source='waste_categories',
        queryset=WasteCategory.objects.all()
    )
    
    class Meta:
        model = CollectionSchedule
        fields = '__all__'
        read_only_fields = ['client', 'created_at', 'updated_at']
        
    def create(self, validated_data):
        waste_categories = validated_data.pop('waste_categories', [])
        schedule = CollectionSchedule.objects.create(**validated_data)
        schedule.waste_categories.set(waste_categories)
        return schedule

class CollectionRequestSerializer(serializers.ModelSerializer):
    waste_categories = WasteCategorySerializer(many=True, read_only=True)
    waste_category_ids = serializers.PrimaryKeyRelatedField(
        many=True, 
        write_only=True,
        source='waste_categories',
        queryset=WasteCategory.objects.all()
    )
    client_name = serializers.CharField(source='client.get_full_name', read_only=True)
    
    class Meta:
        model = CollectionRequest
        fields = '__all__'
        read_only_fields = ['client', 'status', 'created_at', 'updated_at']
        
    def create(self, validated_data):
        waste_categories = validated_data.pop('waste_categories', []),
        schedule = CollectionSchedule.objects.create(**validated_data)
        schedule.waste_categories.set(waste_categories)
        return schedule

class CollectionRequestSerializer(serializers.ModelSerializer):
    waste_categories = WasteCategorySerializer(many=True, read_only=True)
    waste_category_ids = serializers.PrimaryKeyRelatedField(
        many=True, 
        write_only=True,
        source='waste_categories',
        queryset=WasteCategory.objects.all()
    )
    client_name = serializers.CharField(source='client.get_full_name', read_only=True)
    
    class Meta:
        model = CollectionRequest
        fields = '__all__'
        read_only_fields = ['client', 'status', 'created_at', 'updated_at']
        
    def create(self, validated_data):
        waste_categories = validated_data.pop('waste_categories', [])
        request = CollectionRequest.objects.create(**validated_data)
        request.waste_categories.set(waste_categories)
        return request

class CollectionAssignmentSerializer(serializers.ModelSerializer):
    collection_request = CollectionRequestSerializer(read_only=True)
    collector = UserSerializer(read_only=True)
    
    class Meta:
        model = CollectionAssignment
        fields = '__all__'
        read_only_fields = ['assigned_at', 'updated_at']

class WasteCollectionSerializer(serializers.ModelSerializer):
    waste_category_name = serializers.CharField(source='waste_category.name', read_only=True)
    
    class Meta:
        model = WasteCollection
        fields = '__all__'
        read_only_fields = ['collected_at']

class FeedbackRatingSerializer(serializers.ModelSerializer):
    collection_assignment_details = serializers.CharField(source='collection_assignment', read_only=True)
    
    class Meta:
        model = FeedbackRating
        fields = '__all__'
        read_only_fields = ['created_at']


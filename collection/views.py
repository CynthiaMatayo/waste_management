from rest_framework import viewsets, permissions, filters, status
from rest_framework.decorators import action
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q, Sum, Count, Avg
from django.utils import timezone
from datetime import timedelta
from .models import (
    CollectionSchedule, 
    CollectionRequest, 
    CollectionAssignment, 
    WasteCollection, 
    FeedbackRating
)
from .serializers import (
    CollectionScheduleSerializer,
    CollectionRequestSerializer,
    CollectionAssignmentSerializer,
    WasteCollectionSerializer,
    FeedbackRatingSerializer
)


class CollectionScheduleViewSet(viewsets.ModelViewSet):
    queryset = CollectionSchedule.objects.all()
    serializer_class = CollectionScheduleSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return CollectionSchedule.objects.all()
        elif user.user_type == 'collector':
            return CollectionSchedule.objects.filter(collector=user)
        # For clients, show schedules for their area
        return CollectionSchedule.objects.filter(area=user.profile.area)
    
    @action(detail=False, methods=['get'])
    def upcoming(self, request):
        """Get upcoming collection schedules"""
        today = timezone.now().date()
        queryset = self.get_queryset().filter(
            scheduled_date__gte=today
        ).order_by('scheduled_date')[:10]  # Limit to next 10 schedules
        
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class CollectionRequestViewSet(viewsets.ModelViewSet):
    queryset = CollectionRequest.objects.all()
    serializer_class = CollectionRequestSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    @action(detail=True, methods=['post'])
    def approve(self, request, pk=None):
        collection_request = self.get_object()
        if collection_request.status != 'pending':
            return Response({'error': 'Only pending requests can be approved'}, status=status.HTTP_400_BAD_REQUEST)
        
        collection_request.status = 'approved'
        collection_request.save()
        return Response({'status': 'request approved'})
    
    @action(detail=True, methods=['post'])
    def reject(self, request, pk=None):
        collection_request = self.get_object()
        if collection_request.status != 'pending':
            return Response({'error': 'Only pending requests can be rejected'}, status=status.HTTP_400_BAD_REQUEST)
        
        collection_request.status = 'rejected'
        collection_request.save()
        return Response({'status': 'request rejected'})
    
    @action(detail=True, methods=['post'])
    def cancel(self, request, pk=None):
        collection_request = self.get_object()
        if collection_request.status in ['completed', 'cancelled']:
            return Response({'error': 'Cannot cancel completed or already cancelled requests'}, status=status.HTTP_400_BAD_REQUEST)
        
        collection_request.status = 'cancelled'
        collection_request.save()
        return Response({'status': 'request cancelled'})

class CollectionAssignmentViewSet(viewsets.ModelViewSet):
    queryset = CollectionAssignment.objects.all()
    serializer_class = CollectionAssignmentSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return CollectionAssignment.objects.all()
        elif user.user_type == 'collector':
            return CollectionAssignment.objects.filter(collector=user)
        return CollectionAssignment.objects.filter(collection_request__client=user)
    
    @action(detail=True, methods=['post'])
    def update_status(self, request, pk=None):
        assignment = self.get_object()
        new_status = request.data.get('status')
        
        if new_status not in dict(CollectionAssignment.STATUS_CHOICES).keys():
            return Response({'error': 'Invalid status'}, status=status.HTTP_400_BAD_REQUEST)
        
        # Update assignment status
        assignment.status = new_status
        
        # Update related fields based on status
        if new_status == 'in_progress':
            assignment.actual_pickup_time = timezone.now()
        elif new_status == 'completed':
            assignment.completion_time = timezone.now()
            assignment.collection_request.status = 'completed'
            assignment.collection_request.save()
        
        assignment.save()
        return Response({'status': f'Assignment status updated to {new_status}'})

class WasteCollectionViewSet(viewsets.ModelViewSet):
    queryset = WasteCollection.objects.all()
    serializer_class = WasteCollectionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['waste_category', 'assignment']
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return WasteCollection.objects.all()
        elif user.user_type == 'collector':
            return WasteCollection.objects.filter(assignment__collector=user)
        return WasteCollection.objects.filter(assignment__collection_request__client=user)

class FeedbackRatingViewSet(viewsets.ModelViewSet):
    queryset = FeedbackRating.objects.all()
    serializer_class = FeedbackRatingSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        if user.user_type in ['admin', 'manager']:
            return FeedbackRating.objects.all()
        elif user.user_type == 'collector':
            return FeedbackRating.objects.filter(collection_assignment__collector=user)
        return FeedbackRating.objects.filter(collection_assignment__collection_request__client=user)
    
    def perform_create(self, serializer):
        # Check if the user is associated with the collection assignment
        assignment_id = self.request.data.get('collection_assignment')
        try:
            assignment = CollectionAssignment.objects.get(id=assignment_id)
            if (self.request.user == assignment.collection_request.client or 
                self.request.user.user_type in ['admin', 'manager']):
                serializer.save()
            else:
                return Response({'error': 'You do not have permission to submit feedback for this collection'}, 
                               status=status.HTTP_403_FORBIDDEN)
        except CollectionAssignment.DoesNotExist:
            return Response({'error': 'Collection assignment not found'}, status=status.HTTP_404_NOT_FOUND)

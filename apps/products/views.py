from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics, status


from apps.products.models import Product, ProductGroup
from .serializers import ProductSerializer, ProductGroupSerializer

class ProductGroupView(APIView):
    def get(self, request):
        product_group = ProductGroup.objects.filter(is_active=True)
        data = ProductGroupSerializer(product_group, many=True).data
        return Response(data)

# Create your views here.
class ProductListView(APIView):
    def get(self, request):
        products = Product.objects.filter(is_active=True)
        data = ProductSerializer(products, many=True, context={'request': request}).data
        return Response(data)


# class ProductDetailView(APIView):
#     def get(self, request, slug):
#         try:
#             product = Product.objects.get(slug=slug)
#         except Product.DoesNotExist:
#             return Response(status=status.HTTP_404_NOT_FOUND)
#
#         data = ProductSerializer(product, many=False, context={'request': request}).data
#         return Response(data,)

class ProductDetailView(generics.RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'slug'

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['detail'] = True  # حالت جزئیات را فعال کن
        return context
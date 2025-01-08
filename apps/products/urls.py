from django.urls import path

from . import views

app_name = 'products'
urlpatterns = [
    path('list/', views.ProductListView.as_view(), name='list'),
    path('list/<slug:slug>/', views.ProductDetailView.as_view(), name='product_detail'),
    path('group/', views.ProductGroupView.as_view(), name='group'),
]
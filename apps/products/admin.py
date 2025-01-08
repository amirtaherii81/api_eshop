from django.contrib import admin
from .models import Brand, ProductGroup, Feature, Product


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('brand_title', 'slug')
    search_fields = ('brand_title',)
    list_filter = ('brand_title',)
    ordering = ('brand_title',)


class ProductGroupInlineAdmin(admin.TabularInline):
    model = ProductGroup
    extra = 1

@admin.register(ProductGroup)
class ProductGroupAdmin(admin.ModelAdmin):
    list_display = ('group_title', 'group_parent', 'is_active', 'register_date',)
    list_editable = ('is_active',)
    list_filter = ('group_title', 'is_active', 'group_parent', 'register_date',)
    ordering = ('group_title',)
    inlines = (ProductGroupInlineAdmin,)

@admin.register(Feature)
class FeatureAdmin(admin.ModelAdmin):
    list_display = ('feature_name',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_name', 'price', 'is_active', 'register_date',)
    list_filter = ('product_name', 'price', 'product_group', 'is_active')
    search_fields = ('product_name', 'price', 'product_group', 'is_active')
    ordering = ('product_name',)
    list_editable = ('is_active',)



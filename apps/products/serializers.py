from rest_framework import serializers

from apps.products.models import Product, Feature, ProductGroup


class FeatureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Feature
        fields = ['id', 'feature_name']


# serializers.
class GroupParentSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductGroup
        fields = ['group_title', 'image_name', 'description', 'slug',]


class ProductGroupSerializer(serializers.ModelSerializer):
    group_parent = GroupParentSerializer()
    features_of_groups = FeatureSerializer(many=True, read_only=True)
    class Meta:
        model = ProductGroup
        fields = ('id', 'group_title', 'image_name', 'description', 'group_parent', 'features_of_groups')


class ProductSerializer(serializers.HyperlinkedModelSerializer):
    product_group = ProductGroupSerializer(many=True, read_only=True)
    # features = FeatureSerializer(many=True, read_only=True)
    slug = serializers.HyperlinkedIdentityField(view_name='products:product_detail', lookup_field='slug')
    name = serializers.SerializerMethodField('get_name')
    # image_name = serializers.SerializerMethodField('get_image_name')
    class Meta:
        model = Product
        fields = ['name', 'id', 'product_name', 'price', 'summary_description', 'image_name', 'slug', 'product_group']

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if not self.context.get('detail', False):  # اگر در حالت جزئیات نیستیم
            data.pop('image_name', None)  # فیلد image_name را حذف کن
        return data

    def get_name(self, obj):
        return f'product {obj.id}'

    # def get_image_name(self, obj):
    #     return obj.get_file_type_display()
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField
from django.urls import reverse
from django.utils.text import slugify
from datetime import datetime
from django.db.models import Sum, Avg

# from middlewares.middleware import RequestMiddleware
import utils

# Create your models here.
class Brand(models.Model):
    brand_title = models.CharField(_('brand title') ,max_length=100,)
    file_upload = utils.FileUpload('images', 'brand')
    image_name = models.ImageField(_('image brand') ,upload_to=file_upload.upload_to)
    slug = models.SlugField(max_length=200, null=True, db_index=True)

    def __str__(self):
        return self.brand_title

    class Meta:
        # TODO: translate
        verbose_name = 'brand'
        verbose_name_plural = 'brands'



class ProductGroup(models.Model):
    group_title = models.CharField(_('group title'), max_length=100)
    file_upload = utils.FileUpload('images', 'product_group')
    image_name = models.ImageField(_('group photo') ,upload_to=file_upload.upload_to,)
    description = models.TextField(_('description group') ,blank=True, null=True,)
    is_active = models.BooleanField(_('is active') ,default=True, blank=True,)
    group_parent = models.ForeignKey('productGroup', verbose_name=_('parent group'), on_delete=models.CASCADE,
                                     blank=True, null=True, related_name='groups')  # نکته
    register_date = models.DateTimeField(_('create date'), auto_now_add=True, null=True,)
    published_date = models.DateTimeField(_('published date'), default=timezone.now,)
    update_date = models.DateTimeField(_('update date'), auto_now=True,)
    slug = models.SlugField(max_length=200, null=True, db_index=True)

    def __str__(self):
        return self.group_title

    class Meta:
        verbose_name = 'product group'
        verbose_name_plural = 'product groups'


class Feature(models.Model):
    feature_name = models.CharField(_('feature name'), max_length=100,)
    product_group = models.ManyToManyField(ProductGroup, verbose_name=_('product group'), related_name='features_of_groups')

    def __str__(self):
        return self.feature_name

    class Meta:
        verbose_name = 'feature'
        verbose_name_plural = 'features'



class Product(models.Model):
    product_group = models.ManyToManyField(ProductGroup, verbose_name=_('product group'), related_name='products_of_groups')
    features = models.ManyToManyField(Feature, through='ProductFeature')
    brand = models.ForeignKey(Brand, verbose_name=_('brand'), on_delete=models.CASCADE, null=True, blank=True,
                              related_name='product_of_brands')
    product_name = models.CharField(_('product name'), max_length=500,)
    description = RichTextUploadingField(_('description'), config_name='special', blank=True, null=True,)
    summary_description = models.TextField(_('summary description'), default="", blank=True, null=True,)

    file_upload = utils.FileUpload('images', 'product')
    image_name = models.ImageField(_('picture product'), upload_to=file_upload.upload_to,)
    price = models.PositiveIntegerField(_('product price'), default=0,)
    is_active = models.BooleanField(_('is active'), default=True, blank=True,)
    register_date = models.DateField(_('create date'), auto_now_add=True, null=True,)
    published_date = models.DateField(_('publish date'), default=timezone.now,)
    update_date = models.DateField(_('update date'), auto_now=True,)
    slug = models.SlugField(max_length=200, default="", null=False, db_index=True)

    # def get_absolute_url(self):
    #     return reverse('products:product_details', kwargs={'slug': self.slug})

    def save(self, *args, **kwargs):
        self.slug = slugify(self.product_name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.product_name



#     # قیمت ها با تخفیف کالا
#     def get_price_by_discount(self):
#         list1 = []
#         for dbd in self.discount_basket_details2.all():
#             if (dbd.discount_basket.is_active == True and
#                     dbd.discount_basket.start_date <= datetime.now() and
#                     dbd.discount_basket.end_date >= datetime.now()):
#                 list1.append(dbd.discount_basket.discount)
#
#         discount = 0
#         if (len(list1) > 0):
#             discount = max(list1)
#         return int(self.price - (self.price * discount / 100))
#
#
#     def get_number_in_warehouse(self):
#         sum1 = self.warehouse_products.filter(warehouse_type_id=1).aggregate(Sum('qty'))
#         sum2 = self.warehouse_products.filter(warehouse_type_id=2).aggregate(Sum('qty'))
#
#         input = 0
#         if sum1['qty__sum'] != None:
#             input = sum1['qty__sum']
#         output = 0
#         if sum2['qty__sum'] != None:
#             output = sum2['qty__sum']
#         return (input - output)
#
#
#     def get_user_score(self):
#         request = RequestMiddleware(get_response=None)
#         request = request.thread_local.current_request
#         score = 0
#         user_score = self.scoring_product.filter(scoring_user=request.user)
#         if user_score.count() > 0:
#             score = user_score[0].score
#         return score
#
#
#     def get_average_score(self):
#         avgScore = self.scoring_product.all().aggregate(Avg('score'))['score__avg']
#         if avgScore == None:
#             avgScore = 0
#         return '%2.1f' % avgScore
#
#
#     def get_user_favorite(self):
#         request = RequestMiddleware(get_response=None).thread_local.current_request
#         flag = self.favorite_product.filter(favorite_user=request.user).exists()
#         return flag
#
#
#     def get_main_product_group(self):
#         return self.product_group.all()[0].id
#
#     class Meta:
#         verbose_name = 'کالا'
#         verbose_name_plural = 'کالاها'
#


class FeatureValue(models.Model):
    feature = models.ForeignKey(Feature, verbose_name=_('feature'),
                                on_delete=models.CASCADE, blank=True,
                                null=True, related_name='feature_values')
    value_title = models.CharField(_('value title') , max_length=100,)

    def __str__(self):
        return f"{self.id} {self.value_title}"

    class Meta:
        verbose_name = 'feature value'
        verbose_name_plural = 'feature values'


class ProductFeature(models.Model):
    product = models.ForeignKey(Product, verbose_name=_('product'),on_delete=models.CASCADE, related_name='product_feature')
    feature = models.ForeignKey(Feature, verbose_name=_('feature'), on_delete=models.CASCADE)
    value = models.CharField(_('feature value') , max_length=100,)
    filter_value = models.ForeignKey(FeatureValue, on_delete=models.CASCADE, blank=True, null=True,
                                     verbose_name=_('feature value fiter'),)

    def __str__(self):
        return f"{self.product} - {self.feature} : {self.value}"

    class Meta:
        verbose_name = 'product feature'
        verbose_name_plural = 'product features'

class ProductGallery(models.Model):
    product = models.ForeignKey(Product,verbose_name=_('product'),  on_delete=models.CASCADE, related_name='gallery_images')
    file_upload = utils.FileUpload('images', 'product_gallery')
    image_name = models.ImageField(_('image product'), upload_to=file_upload.upload_to,)

    class Meta:
        verbose_name = 'images product'
        verbose_name_plural = 'images products'


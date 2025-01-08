from django.contrib import admin

from django.contrib.auth.admin import UserAdmin
from .forms import UserChangeForm, UserCreationForm
from apps.accounts.models import CustomUser


# Register your models here.
@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = ('mobile_number', 'email', 'first_name', 'last_name', 'gender', 'is_active', 'is_admin')
    list_filter = ('is_active', 'is_admin', 'last_name')
    list_editable = ('is_active', 'is_admin')


    fieldsets = (
        (None, {
            "fields": (
                'mobile_number', 'password')}),
        ('personal info', {
            'fields': ('email', 'first_name', 'last_name', 'gender', 'active_code')}),
        ('Permissions', {
            'fields': ('is_active', 'is_admin', 'groups', 'user_permissions')}),
    )

    add_fieldsets = (
        (None, {'fields':
                    ('mobile_number', 'email', 'first_name', 'last_name', 'gender', 'password1', 'password2')
                }
        ),
    )

    search_fields = ('mobile_number', 'first_name', 'last_name')
    ordering = ('mobile_number', 'first_name')
    # filter_horizontal = ('group', 'user_permissions')
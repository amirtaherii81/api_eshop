from django import forms
from .models import CustomUser
from django.core.exceptions import ValidationError
from django.contrib.auth.forms import ReadOnlyPasswordHashField


class UserCreationForm(forms.ModelForm):
    password1 = forms.CharField(label="password", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Repassword", widget=forms.PasswordInput)
    class Meta:
        model = CustomUser
        fields = ['mobile_number', 'email', 'first_name', 'last_name', 'gender']

    def clean_password2(self):
        pass1 = self.cleaned_data.get('password1')
        pass2 = self.cleaned_data.get('password2')
        if pass1 and pass2 and pass1 != pass2:
            raise ValidationError('رمز عبور و تکرار آن باهم مغایرت دارند')
        return pass2

    def save(self, commit=True):
        user = super().save(commit=False)  #
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    password = ReadOnlyPasswordHashField(help_text="<a href='../password'>تغییر رمز عبور </a>")
    class Meta:
        model = CustomUser
        fields = ['mobile_number', 'email', 'first_name', 'last_name', 'gender', 'is_active', 'is_admin']


#
# class UserCreationForm(forms.ModelForm):
#     password1 = forms.CharField(label="رمز عبور", widget=forms.PasswordInput)
#     password2 = forms.CharField(label="تکرار رمز عبور", widget=forms.PasswordInput)
#
#     class Meta:
#         model = CustomUser
#         fields = ['mobile_number', 'email', 'first_name', 'last_name', 'gender']
#
#     def clean(self):
#         cleaned_data = super().clean()
#         password1 = cleaned_data.get("password1")
#         password2 = cleaned_data.get("password2")
#
#         if password1 and password2 and password1 != password2:
#             raise ValidationError('رمز عبور و تکرار آن باهم مغایرت دارند')
#
#     def save(self, commit=True):
#         user = super().save(commit=False)
#         user.set_password(self.cleaned_data['password1'])
#         if commit:
#             user.save()
#         return user
#
#
# class UserChangeForm(forms.ModelForm):
#     password = ReadOnlyPasswordHashField(help_text="<a href='../password'>تغییر رمز عبور </a>")
#
#     class Meta:
#         model = CustomUser
#         fields = ['mobile_number', 'email', 'first_name', 'last_name', 'gender', 'is_active', 'is_admin']
"""hospital_system URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,re_path, include
from hospital_system import views

urlpatterns = [
    path('admin/', admin.site.urls),
    #first page
    path(route='',view=views.index,name='index'),
    path(route='log_create', view=views.log_create, name='log_create'),
    path(route='welcome', view=views.welcome, name='welcome'),
    #wrong page
    #patient
    path(route='patient_list',view=views.patient_list,name='patient_list' ),
    path(route='add_patient/',view=views.add_patient, name='add_patient'),
    path(route='patient_detail/<int:pid>/', view=views.patient_detail, name='patient_detail'),
    path(route='delete_patient/', view=views.delete_patient, name='delete_patient'),
    path(route='modify_patient/',view=views.modify_patient,name='modify_patient'),
    path(route='select_patient/',view=views.select_patient,name='select_patient'),
    #hospital
    path(route='hospital_list/',view=views.hospital_list,name='hospital_list'),
    path(route='hospital_detail/<int:hid>/', view=views.hospital_detail, name='hospital_detail'),
    path(route='delete_hospital/', view=views.delete_hospital, name='delete_hospital'),
    path(route='add_hospital/', view=views.add_hospital, name='add_hospital'),
    path(route='modify_hospital/', view=views.modify_hospital, name='modify_hospital'),
    path(route='select_hospital/', view=views.select_hospital, name='select_hospital'),
    #disease
    path(route='users_list/', view=views.users_list, name='users_list'),
    path(route='users_detail/<int:usid>/', view=views.users_detail, name='users_detail'),
    path(route='delete_users/', view=views.delete_users, name='delete_users'),
    path(route='add_users/', view=views.add_users, name='add_users'),
    path(route='modify_users/', view=views.modify_users, name='modify_users'),
    path(route='select_users/', view=views.select_users, name='select_users'),
]

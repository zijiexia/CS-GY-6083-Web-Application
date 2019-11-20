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

from django.urls import path,re_path
from front import views

urlpatterns = [
    path(route='',view=views.index,name='index' ),
    path(route='add_patient/',view=views.add_patient, name='add_patient'),
    path(route='patient_detail/<int:pid>/', view=views.patient_detail, name='patient_detail'),
    path(route='delete_patient/', view=views.delete_patient, name='delete_patient'),
    path(route='modify_patient/',view=views.modify_patient,name='modify_patient'),
    path(route='select_patient/',view=views.select_patient,name='select_patient')
]

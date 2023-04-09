from django.urls import path
from .views import *
from knox import views as knox_views

urlpatterns = [
    path('register/', RegistrationAPI.as_view()),
    path('login/', LoginAPI.as_view()),
    path('user/', UserAPI.as_view()),
    path('logout/', knox_views.LogoutView.as_view(), name='knox_logout'),
    path('userdetail',UserAPI.as_view(),name='userdetail'),
    path('ml-model/',Newssource.as_view(),name='ml-model'),
    path('price-cal/',pricecalculation.as_view(),name='price-cal')
    ]

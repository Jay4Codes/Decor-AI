from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets, permissions, generics
from rest_framework.response import Response
from knox.models import AuthToken
from django.shortcuts import render
from rest_framework.views import APIView
from .serializers import *
import replicate
import os
import base64
class RegistrationAPI(generics.GenericAPIView):
    serializer_class = CreateUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })


class LoginAPI(generics.GenericAPIView):
    serializer_class = LoginUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data
        
             
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })

class UserAPI(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated, ]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user


class Newssource(APIView):
    def post(self,request):

    	os.environ["REPLICATE_API_TOKEN"] = "Rapid_IPD_key"
    	model = replicate.models.get('rossjillian/controlnet')

    	prompt = request.data['prompt']
    	image = request.data['image']
    	print(image)
    	data['image'] = data['image'].replace('data:image/jpeg;base64,', '')
    	img = Image.open(io.BytesIO(
    	            base64.decodebytes(bytes(data['image'], "utf-8"))))

    	print(img)

    	tol = model.predict(image=open(img, "rb"),prompt=prompt,structure = "scribble")
    	print(tol)
    	data = {'image':tol}
    	return Response(data)



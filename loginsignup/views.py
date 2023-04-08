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
from PIL import Image
import io
import json
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
        os.environ["REPLICATE_API_TOKEN"] = "r8_VHjBVBjw2jDcDobmBWabZxwcdozfPy73gTc9c"
        model = replicate.models.get('rossjillian/controlnet')
        # prompt = request.data['prompt']
        # print(prompt)
        # image = request.data['image']
        # print(image)
        data = json.loads(request.body)
        prompt = data['prompt']
        print("data",data['image'])
        data['image'] = data['image'].replace('data:image/jpeg;base64,', '')
        img = Image.open(io.BytesIO(
                    base64.decodebytes(bytes(data['image'], "utf-8"))))
        #Image.save(img, "image.jpg")
        img.save("image.jpg")
        print(img)
        tol = model.predict(image=open('./image.jpg', "rb"),prompt=prompt,structure = "scribble")
        print(tol)
        data = {'image':tol}
        return Response(data)

class pricecalculation(APIView):
	def post(self, request):

		type_of_project = request.POST.get('type_of_project')
		select_space = request.POST.get('select_space')
		bhk = request.POST.get('bhk')
		carpet_area = request.POST.get('carpet_area')

		if 500<=int(carpet_area)<700:
			data = [{'title':'Royale Shyne Luxury Emulsion','desc':'Luxury has many forms, and one of them is the Royale Shyne Luxury Emulsion. A high sheen, washable wall paint with stain-resistant finish ensures walls look new for a long time. The paint’s high gloss and even smoother finish would make you want to stare at it all day. It’s the only paint emulsion in India equipped with Teflon surface protector that makes it highly durable.',
			'ltr': '26 - 30','price': '23074 - 26370'},{'title':'Royale MATT','desc':'Bumpless walls for a smooth look and luxurious feel, Royale Matt Luxury Emulsion gives the perfect matt finish to your walls. It’s the only','ltr':'26- 30','price': '23336 - 26670'},
			{'title':'Royale Luxury emulsion','desc':'Luxury is just a brushstroke away with Royale Luxury Emulsion. It’s the only paint emulsion in India equipped with Teflon surface protector',
			'ltr':'26-30','price':'21263 - 24300'}]
			return Response(data)

		if 700<=int(carpet_area)<1000:
			data = [{'title':'Royale Shyne Luxury Emulsion','desc':'Luxury has many forms, and one of them is the Royale Shyne Luxury Emulsion. A high sheen, washable wall paint with stain-resistant finish ensures walls look new for a long time. The paint’s high gloss and even smoother finish would make you want to stare at it all day. It’s the only paint emulsion in India equipped with Teflon surface protector that makes it highly durable.',
			'ltr': '35-40','price': '30765 - 35160'},{'title':'Royale MATT','desc':'Bumpless walls for a smooth look and luxurious feel, Royale Matt Luxury Emulsion gives the perfect matt finish to your walls. It’s the only','ltr':'35 - 40','price': '31115 - 35560'},
			{'title':'Royale Luxury emulsion','desc':'Luxury is just a brushstroke away with Royale Luxury Emulsion. It’s the only paint emulsion in India equipped with Teflon surface protector',
			'ltr':'23 - 28','price':'20067 - 24080'}]
			return Respose(data)
		if 1000<=int(carpet_area):
			data = [{'title':'Royale Shyne Luxury Emulsion','desc':'Luxury has many forms, and one of them is the Royale Shyne Luxury Emulsion. A high sheen, washable wall paint with stain-resistant finish ensures walls look new for a long time. The paint’s high gloss and even smoother finish would make you want to stare at it all day. It’s the only paint emulsion in India equipped with Teflon surface protector that makes it highly durable.',
			'ltr': '48-55','price': '42302 - 48345'},{'title':'Royale MATT','desc':'Bumpless walls for a smooth look and luxurious feel, Royale Matt Luxury Emulsion gives the perfect matt finish to your walls. It’s the only','ltr':'48 - 55','price': '42783 - 488895'},
			{'title':'Royale Luxury emulsion','desc':'Luxury is just a brushstroke away with Royale Luxury Emulsion. It’s the only paint emulsion in India equipped with Teflon surface protector',
			'ltr':'32-39','price':'27592 - 33110'}]
			return Response(data)

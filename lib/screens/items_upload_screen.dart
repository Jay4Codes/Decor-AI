import 'dart:typed_data';

import 'package:codeshastra/screens/api_consumer.dart';
import 'package:codeshastra/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeshastra/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class ItemsUploadScreen extends StatefulWidget {
  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {
  Uint8List? imageFileUint8List;
  bool isImagePicked = false;

  TextEditingController sellerNameTextEditingController = TextEditingController();
  TextEditingController sellerPhoneTextEditingController = TextEditingController();
  TextEditingController itemNameTextEditingController = TextEditingController();
  TextEditingController itemDescriptionTextEditingController = TextEditingController();
  TextEditingController itemPriceTextEditingController = TextEditingController();

  bool isUploading = false;
  String downloadUrlOfUploadedImage = "";

  //upload form screen
  Widget uploadFormScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                //validate upload form fields
                if (isUploading != true) //false
                {
                  validateUploadFormAndUploadItemInfo();
                }
              },
              icon: const Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          isUploading == true
              ? const LinearProgressIndicator(
                  color: Colors.purpleAccent,
                )
              : Container(),

          //image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: imageFileUint8List != null
                  ? Image.memory(imageFileUint8List!)
                  : const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 40,
                    ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //seller name
          ListTile(
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,
            ),
            title: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), border: Border.all(width: 1, color: Colors.white)),
              child: TextField(
                cursorColor: kPrimaryColor,
                style: const TextStyle(color: Colors.grey),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Your name",
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //seller phone
          ListTile(
            leading: const Icon(
              Icons.phone_iphone_rounded,
              color: Colors.white,
            ),
            title: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), border: Border.all(width: 1, color: Colors.white)),
              child: TextField(
                cursorColor: kPrimaryColor,
                style: const TextStyle(color: Colors.grey),
                controller: sellerPhoneTextEditingController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Your phone number",
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //item name
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.white,
            ),
            title: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), border: Border.all(width: 1, color: Colors.white)),
              child: TextField(
                cursorColor: kPrimaryColor,
                style: const TextStyle(color: Colors.grey),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "item name",
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //item description
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Colors.white,
            ),
            title: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), border: Border.all(width: 1, color: Colors.white)),
              child: TextField(
                cursorColor: kPrimaryColor,
                style: const TextStyle(color: Colors.grey),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: "item description",
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //item price
          ListTile(
            leading: const Icon(
              Icons.price_change,
              color: Colors.white,
            ),
            title: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), border: Border.all(width: 1, color: Colors.white)),
              child: TextField(
                cursorColor: kPrimaryColor,
                style: const TextStyle(color: Colors.grey),
                controller: itemPriceTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "item price",
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  validateUploadFormAndUploadItemInfo() async {
    if (imageFileUint8List != null) {
      if (sellerNameTextEditingController.text.isNotEmpty &&
          sellerPhoneTextEditingController.text.isNotEmpty &&
          itemNameTextEditingController.text.isNotEmpty &&
          itemDescriptionTextEditingController.text.isNotEmpty &&
          itemPriceTextEditingController.text.isNotEmpty) {
        setState(() {
          isUploading = true;
        });

        //1.upload image to firebase storage
        String imageUniqueName = DateTime.now().millisecondsSinceEpoch.toString();

        fStorage.Reference firebaseStorageRef =
            fStorage.FirebaseStorage.instance.ref().child("Items Images").child(imageUniqueName);

        fStorage.UploadTask uploadTaskImageFile = firebaseStorageRef.putData(imageFileUint8List!);

        fStorage.TaskSnapshot taskSnapshot = await uploadTaskImageFile.whenComplete(() {});

        await taskSnapshot.ref.getDownloadURL().then((imageDownloadUrl) {
          downloadUrlOfUploadedImage = imageDownloadUrl;
        });

        //2.save item info to firestore database
        saveItemInfoToFirestore();
      } else {
        Fluttertoast.showToast(msg: "Please complete upload form. Every field is mandatory.");
      }
    } else {
      Fluttertoast.showToast(msg: "Please select image file.");
    }
  }

  saveItemInfoToFirestore() {
    String itemUniqueId = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseFirestore.instance.collection("items").doc(itemUniqueId).set({
      "itemID": itemUniqueId,
      "itemName": itemNameTextEditingController.text,
      "itemDescription": itemDescriptionTextEditingController.text,
      "itemImage": downloadUrlOfUploadedImage,
      "sellerName": sellerNameTextEditingController.text,
      "sellerPhone": sellerPhoneTextEditingController.text,
      "itemPrice": itemPriceTextEditingController.text,
      "publishedDate": DateTime.now(),
      "status": "available",
    });

    Fluttertoast.showToast(msg: "your new Item uploaded successfully.");

    setState(() {
      isUploading = false;
      imageFileUint8List = null;
    });

    Navigator.pop(context);
  }

  //default screen
  Widget defaultScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
              size: 200,
            ),
            ElevatedButton(
              onPressed: () {
                showDialogBox();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
              ),
              child: const Text(
                "Add New Item",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() {
    return showDialog(
        context: context,
        builder: (c) {
          return SimpleDialog(
            backgroundColor: Colors.black,
            title: const Text(
              "Item Image",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  captureImageWithPhoneCamera();
                },
                child: const Text(
                  "Capture image with Camera",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  chooseImageFromPhoneGallery();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Choose image from Gallery",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          );
        });
  }

  captureImageWithPhoneCamera() async {
    Navigator.pop(context);

    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

      setState(() {
        isImagePicked = true;
      });

      if (pickedImage != null) {
        String imagePath = pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        //remove background from image
        //make image transparent
        imageFileUint8List = await ApiConsumer().removeImageBackgroundApi(imagePath);

        setState(() {
          imageFileUint8List;
        });
      }
    } catch (errorMsg) {
      print(errorMsg.toString());

      setState(() {
        imageFileUint8List = null;
        isImagePicked = false;
      });
    }
  }

  chooseImageFromPhoneGallery() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      setState(() {
        isImagePicked = true;
      });

      if (pickedImage != null) {
        String imagePath = pickedImage.path;

        imageFileUint8List = await pickedImage.readAsBytes();

        //remove background from image
        //make image transparent
        imageFileUint8List = await ApiConsumer().removeImageBackgroundApi(imagePath);
        print(imagePath);
        setState(() {
          imageFileUint8List;
        });
      }
    } catch (errorMsg) {
      print(errorMsg.toString());

      setState(() {
        imageFileUint8List = null;
        isImagePicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isImagePicked
        ? defaultScreen()
        : imageFileUint8List == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              )
            : uploadFormScreen();
  }
}

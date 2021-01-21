import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geeky_booky/Screen/splashscreen.dart';
import 'package:geeky_booky/Widget/loadingWidget.dart';
import 'package:image_picker/image_picker.dart';

import 'adminShiftOrders.dart';

class UploadItemsPage extends StatefulWidget {
  @override
  _UploadItemsPageState createState() => _UploadItemsPageState();
}

class _UploadItemsPageState extends State<UploadItemsPage> {
  File imageFile;
  TextEditingController _descriptionTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _shortInfoTextEditingController = TextEditingController();

  //Unique name to each products  that admin uploads.
  // Cannot be replaced
  String productId = DateTime.now().millisecondsSinceEpoch.toString();

  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return imageFile == null
        ? displayHomeScreen(context)
        : displayAdminUploadFormScreen();
  }

  displayHomeScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.border_color, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(this.context,
                MaterialPageRoute(builder: (context) => AdminShiftOrders()));
          },
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            },
            child: Text(
              "LogOut",
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
      body: getAdminHomeScreenBody(context),
    );
  }

  getAdminHomeScreenBody(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_two,
              size: 200,
              color: Colors.red[600],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                    "Add New Items",
                  style: TextStyle(
                    color: Colors.deepPurple[700],
                  ),
                ),
                onPressed: () => takeImage(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future takeImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose a photo'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  displayAdminUploadFormScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            clearFormInfo();
          },
        ),
        title: Text(
          "New Item",
          style: TextStyle(
            color: Colors.deepPurple[600],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: uploading ? null : () => uploadImageAndSaveItemInfo(),
            child: Text("Add"),
          )
        ],
      ),
      body: ListView(
        children: [
          uploading ? circularProgress() : Text(""),
          Container(
            height: 230,
            width: MediaQuery.of(this.context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: FileImage(imageFile),
                      fit: BoxFit.cover,
                    )),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfoTextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),


        ],
      ),
    );
  }

  clearFormInfo() {
    setState(() {
      imageFile = null;
      _descriptionTextEditingController.clear();
      _titleTextEditingController.clear();
      _priceTextEditingController.clear();
      _shortInfoTextEditingController.clear();
    });
  }

  //Save Images and Items to Database
  uploadImageAndSaveItemInfo() {
    setState(() {
      uploading = true;
    });
    uploadItemImage(imageFile);

  }
  //TODO: Upload items photo, short info price and desc  to databases

  Future<String> uploadItemImage(mfileImage) async{

  }
}

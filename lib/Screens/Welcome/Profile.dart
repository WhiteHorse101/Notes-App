import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

// This is still incomplete
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? profile_pic = null;
  //final picker = ImagePicker();

  Future getImage() async {
    // final image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      //   profile_pic = image as File;
      print('Img Path $profile_pic');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 300,
                  child: Card(
                    color: Color(0xff262A34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80, top: 600),
                  child: ButtonTheme(
                      minWidth: 230,
                      child: RaisedButton(
                        onPressed: () {
                          print("Logout Pressed");
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        elevation: 8,
                        color: Color(0xff246BFE),
                        child: Text(
                          'Logout',
                        ),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 150, top: 20),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xffFFFFFF),
                    child: (profile_pic != null)
                        ? Image.file(
                            profile_pic!,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            "https://unsplash.com/photos/dFnoV-mpiGY",
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 85, left: 230),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_rounded),
                    onPressed: () {
                      getImage();
                      print("Cam pressed");
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 320, left: 20),
                  child: Text(
                    "Your Reminders",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 145, left: 150),
                  child: Text(
                    "Name Here",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 185, left: 165),
                  child: Text(
                    "Email id here",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xff8ED1D0)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // Do not delete this line of code this saves the code from Null Safety

        // Appbar Code
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            )
          ],
        ),

        // Side Drawer Code
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Notes App',
                  style: TextStyle(fontSize: 45),
                ),
              ),
              ListTile(
                title: Text(
                  "Add New Note",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Reminders",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "Trash",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Edit Note",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "Setting",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "Chnage Theme",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    // Code to create a card and identify the gestures
                    GestureDetector(
                      onTap: () {
                        print("Card Tapped");
                      },
                      child: Container(
                        width: 200,
                        height: 300,
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.white,
                          elevation: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
